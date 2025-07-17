import 'package:cheng/components/my_drawer.dart';
import 'package:cheng/models/food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:cheng/models/baker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final bool useMaterial3;
  const HomePage({super.key, this.useMaterial3 = false});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<DocumentSnapshot> filteredOrders = [];
  bool isDateFiltered = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _filterOrdersByToday();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _onMenuSelected(String value, String orderId) async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .update({'orderStatus': value.toLowerCase()});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order status changed to: $value')),
      );
      _filterOrdersByToday();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update order status: $e')),
      );
    }
  }

  void _filterOrdersByToday() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', whereIn: [
      'reviewing',
      'finalized',
      'finished',
      'ready for delivery/pickup'
    ]).get();

    setState(() {
      filteredOrders = querySnapshot.docs;
      isDateFiltered = false;
    });
  }

  void _show3DModel(BuildContext context, String cakeName,
      {String? modelPath}) {
    if (modelPath != null && modelPath.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              width: 400,
              height: 400,
              child: ModelViewer(
                src: modelPath,
                ar: true,
                autoRotate: true,
                cameraControls: true,
              ),
            ),
          );
        },
      );
    } else {
      final Baker baker = Provider.of<Baker>(context, listen: false);
      Food? selectedFood =
          baker.menu.firstWhereOrNull((food) => food.name == cakeName);

      if (selectedFood?.modelpath.isNotEmpty ?? false) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SizedBox(
                width: 400,
                height: 400,
                child: ModelViewer(
                  src: selectedFood!.modelpath,
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                ),
              ),
            );
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('3D model not available for $cakeName')),
        );
      }
    }
  }

  void _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (selectedDate == null) {
      _filterOrdersByToday();
      return;
    }

    DateTime startOfDay =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    DateTime endOfDay = DateTime(
        selectedDate.year, selectedDate.month, selectedDate.day, 23, 59, 59);

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endOfDay))
        .where('orderStatus', whereIn: [
      'reviewing',
      'finalized',
      'finished',
      'ready for delivery/pickup'
    ]).get();

    setState(() {
      filteredOrders = querySnapshot.docs;
      isDateFiltered = true;
    });
  }

  Color getOrderStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'reviewing':
        return const Color.fromARGB(255, 244, 58, 120);
      case 'finalized':
        return Colors.orange;
      case 'finished':
        return Colors.lightBlue;
      case 'ready for delivery/pickup':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delicieux'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Rush'),
            Tab(text: 'Reserve'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList('Rush'),
          _buildOrderList('Reserve'),
        ],
      ),
    );
  }

  Widget _buildOrderList(String orderType) {
    if (isDateFiltered) {
      return _buildOrderListView(filteredOrders, orderType);
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('orderStatus', whereIn: [
        'reviewing',
        'finalized',
        'finished',
        'ready for delivery/pickup'
      ]).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<DocumentSnapshot> orders = snapshot.data!.docs;
        return _buildOrderListView(orders, orderType);
      },
    );
  }

  Widget _buildOrderListView(List<DocumentSnapshot> orders, String orderType) {
    List<DocumentSnapshot> filteredOrders = orders
        .where((order) =>
            order['orderType'] == orderType &&
            order['orderStatus'] != 'cancelled')
        .toList();

    if (filteredOrders.isEmpty) {
      return Center(
        child: Text(isDateFiltered
            ? 'No orders found for selected date.'
            : 'No orders found.'),
      );
    }

    final Map<String, List<DocumentSnapshot>> groupedOrders = {};

    for (var order in filteredOrders) {
      String orderId = order['orderId'];
      if (!groupedOrders.containsKey(orderId)) {
        groupedOrders[orderId] = [];
      }
      groupedOrders[orderId]!.add(order);
    }

    return ListView.builder(
      itemCount: groupedOrders.length,
      itemBuilder: (context, index) {
        String orderId = groupedOrders.keys.elementAt(index);
        List<DocumentSnapshot> orderGroup = groupedOrders[orderId]!;
        final order = orderGroup.first;
        final List<dynamic> cartItems = order['cartItems'];

        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order ID: $orderId',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Customer: ${order['customerName']}'),
                    Text('Contact Number: ${order['contactNumber']}',
                        style: const TextStyle(fontSize: 14)),
                    Text(
                        'Mode of Delivery: ${(order.data() as Map<String, dynamic>)['deliveryOption'] ?? 'N/A'}'),
                    Text(
                        'Date: ${DateFormat.yMMMd().format((order['date'] as Timestamp).toDate())}'),
                    Row(
                      children: [
                        const Text('Order Status: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          order['orderStatus'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: getOrderStatusColor(order['orderStatus']),
                          ),
                        ),
                      ],
                    ),
                    Text('Total Price: P${order['totalPrice']}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Column(
                      children: cartItems.map((item) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  item['imagepath'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Cake name: ${item['CakeName']}'),
                                      Text('Quantity: ${item['quantity']}'),
                                      const SizedBox(height: 4),
                                      Text(
                                          'Addons: ${item['addons']?.join(", ") ?? "None"}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _show3DModel(context, item['CakeName']);
                              },
                              child: const Text('View 3D Model'),
                            ),
                            const Divider(),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: PopupMenuButton<String>(
                onSelected: (value) async {
                  await _onMenuSelected(value, orderId);
                  setState(() {});
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Finalized',
                    enabled: order['orderStatus'] != 'finalized' &&
                        order['orderStatus'] != 'finished' &&
                        order['orderStatus'] != 'ready for delivery/pickup',
                    child: const Text('Finalized'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Finished',
                    enabled: order['orderStatus'] == 'finalized',
                    child: const Text('Finished'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Ready for Delivery/Pickup',
                    enabled: order['orderStatus'] == 'finished',
                    child: const Text('Ready for Delivery/Pickup'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
