import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int finishedOrderCount = 0;
  double totalSales = 0;
  List<Map<String, dynamic>> ordersData = [];
  String selectedFilter = 'Day';
  DateTime? selectedMonth;

  @override
  void initState() {
    super.initState();
    _fetchOrdersData();
  }

  Future<bool> _requestPermissions() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return false;
  }

  Future<void> _selectMonth(BuildContext context) async {
    final pickedMonth = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedMonth != null) {
      setState(() {
        selectedMonth = pickedMonth;
        _fetchOrdersData();
      });
    }
  }

  Future<void> _fetchOrdersData() async {
    try {
      DateTime now = DateTime.now();
      DateTime startDate;
      DateTime endDate;

      switch (selectedFilter) {
        case 'Day':
          startDate = DateTime(now.year, now.month, now.day);
          endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
          break;
        case 'Week':
          int daysToSubtract = now.weekday - DateTime.monday;
          startDate = now.subtract(Duration(days: daysToSubtract));
          endDate = startDate.add(
              const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));
          break;
        case 'Month':
          startDate = selectedMonth != null
              ? DateTime(selectedMonth!.year, selectedMonth!.month, 1)
              : DateTime(now.year, now.month, 1);
          endDate = DateTime(startDate.year, startDate.month + 1, 1)
              .subtract(const Duration(seconds: 1));
          break;
        default:
          startDate = DateTime(now.year, now.month, now.day);
          endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      }

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('orderStatus', isEqualTo: 'completed')
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
          .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
          .get();

      List<Map<String, dynamic>> fetchedData = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      double sales = fetchedData.fold(0, (sum, order) {
        return sum + (order['totalPrice'] ?? 0);
      });

      setState(() {
        ordersData = fetchedData;
        finishedOrderCount = fetchedData.length;
        totalSales = sales;
      });
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  String formatDate(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _downloadPDF() async {
    try {
      final pdf = pw.Document();
      DateTime now = DateTime.now();
      DateTime startDate;
      DateTime endDate;
      String dateRange;

      switch (selectedFilter) {
        case 'Day':
          startDate = DateTime(now.year, now.month, now.day);
          endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
          dateRange = 'Date: ${DateFormat('yyyy-MM-dd').format(startDate)}';
          break;
        case 'Week':
          int daysToSubtract = now.weekday - DateTime.monday;
          startDate = now.subtract(Duration(days: daysToSubtract));
          endDate = startDate.add(
              const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));
          dateRange =
              'Week: ${DateFormat('yyyy-MM-dd').format(startDate)} - ${DateFormat('yyyy-MM-dd').format(endDate)}';
          break;
        case 'Month':
          startDate = selectedMonth != null
              ? DateTime(selectedMonth!.year, selectedMonth!.month, 1)
              : DateTime(now.year, now.month, 1);
          endDate = DateTime(startDate.year, startDate.month + 1, 1)
              .subtract(const Duration(seconds: 1));
          dateRange =
              'Month: ${DateFormat('yyyy-MM-dd').format(startDate)} - ${DateFormat('yyyy-MM-dd').format(endDate)}';
          break;
        default:
          startDate = DateTime(now.year, now.month, now.day);
          endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
          dateRange = 'Date: ${DateFormat('yyyy-MM-dd').format(startDate)}';
      }

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Sales Report',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text('Number of Completed Orders: $finishedOrderCount',
                  style: const pw.TextStyle(fontSize: 18)),
              pw.Text('Total Sales: P${totalSales.toString()}',
                  style: const pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 16),
              pw.Text(dateRange, style: const pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 16),
              pw.Table.fromTextArray(
                headers: [
                  'Order ID',
                  'Customer Name',
                  'Total Price',
                  'Order Status',
                  'Date',
                  'Time'
                ],
                data: ordersData.map((order) {
                  String date = order['date'] is Timestamp
                      ? formatDate(order['date'])
                      : order['date'] ?? '';
                  return [
                    order['orderId'] ?? '',
                    order['customerName'] ?? '',
                    order['totalPrice']?.toString() ?? '',
                    order['orderStatus'] ?? '',
                    date,
                    order['time'] ?? '',
                  ];
                }).toList(),
              ),
            ],
          ),
        ),
      );

      String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final directory = await getExternalStorageDirectories();
      final path = '${directory!.first.path}/report_$timestamp.pdf';
      final file = File(path);
      await file.writeAsBytes(await pdf.save());
      print('PDF file saved at $path');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF file saved at $path')),
      );
    } catch (e) {
      print('Error saving PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: _downloadPDF,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedFilter,
              items: <String>['Day', 'Week', 'Month'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFilter = newValue!;
                  if (selectedFilter == 'Month') {
                    _selectMonth(
                        context); // Open month picker if "Month" is selected
                  } else {
                    selectedMonth = null;
                    _fetchOrdersData();
                  }
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Number of Completed Orders: $finishedOrderCount',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Sales: P${totalSales.toString()}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Order ID')),
                  DataColumn(label: Text('Customer Name')),
                  DataColumn(label: Text('Total Price')),
                  DataColumn(label: Text('Order Status')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Time')),
                ],
                rows: ordersData.map((order) {
                  String date = '';
                  if (order['date'] is Timestamp) {
                    date = formatDate(order['date']);
                  } else if (order['date'] is String) {
                    date = order['date'];
                  }

                  return DataRow(
                    cells: [
                      DataCell(Text(order['orderId'] ?? '')),
                      DataCell(Text(order['customerName'] ?? '')),
                      DataCell(Text(order['totalPrice']?.toString() ?? '')),
                      DataCell(Text(order['orderStatus'] ?? '')),
                      DataCell(Text(date)),
                      DataCell(Text(order['time'] ?? '')),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
