import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<dynamic>> _ordersByDate = {}; // Orders grouped by date
  List<dynamic> _selectedDayOrders = []; // Orders for the selected day
  int? _currentAvailability; // Current availability for the selected date
  TextEditingController _availabilityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchOrders();
    _fetchAvailability(
        _focusedDay); // Fetch initial availability for the focused day
  }

  // Helper function to remove the time from DateTime to get only the date
  DateTime _getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  // Fetch orders and group them by date
  void _fetchOrders() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', whereIn: [
      'reviewing',
      'finalized',
      'finished',
      'ready for delivery/pickup'
    ]) // Exclude 'cancelled' and 'completed'
        .get();

    Map<DateTime, List<dynamic>> ordersMap = {};

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DateTime orderDate = (data['date'] as Timestamp).toDate();

      // Remove time to group by date only
      DateTime dateOnly = _getDateOnly(orderDate);

      if (!ordersMap.containsKey(dateOnly)) {
        ordersMap[dateOnly] = [];
      }
      ordersMap[dateOnly]!.add(data);
    }

    setState(() {
      _ordersByDate = ordersMap;
    });
  }

  // Fetch availability for the selected date
  void _fetchAvailability(DateTime date) async {
    try {
      String formattedDate = "${date.month}-${date.day}-${date.year}";
      DocumentSnapshot availabilityDoc = await FirebaseFirestore.instance
          .collection('order_remaining')
          .doc(formattedDate)
          .get();

      setState(() {
        if (availabilityDoc.exists) {
          _currentAvailability = availabilityDoc['availability'];
          _availabilityController.text = _currentAvailability.toString();
        } else {
          // Default to 30 if not set
          _currentAvailability = 30;
          _availabilityController.text = '30';
        }
      });
    } catch (e) {
      print("Error fetching availability: $e");
      setState(() {
        _currentAvailability = 30;
        _availabilityController.text = '30';
      });
    }
  }

  // Update availability in Firestore
  Future<void> _updateAvailability(DateTime date, int availability) async {
    try {
      String formattedDate = "${date.month}-${date.day}-${date.year}";
      DocumentReference availabilityDoc = FirebaseFirestore.instance
          .collection('order_remaining')
          .doc(formattedDate);

      await availabilityDoc
          .set({'availability': availability}, SetOptions(merge: true));

      setState(() {
        _currentAvailability = availability;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Availability updated successfully!"),
      ));
    } catch (e) {
      print("Error updating availability: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to update availability."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar widget
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;

                  // Update selected day's orders
                  _selectedDayOrders =
                      _ordersByDate[_getDateOnly(selectedDay)] ?? [];
                });

                // Fetch availability for the selected date
                _fetchAvailability(selectedDay);
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              eventLoader: (day) {
                return _ordersByDate[_getDateOnly(day)] ?? [];
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isNotEmpty) {
                    return Positioned(
                      right: 1,
                      bottom: 1,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${events.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                selectedDecoration: BoxDecoration(
                  color: _selectedDay != null &&
                          isSameDay(_selectedDay, DateTime.now())
                      ? Colors.blue
                      : Colors.grey,
                  border: Border.all(
                      color: _selectedDay != null &&
                              isSameDay(_selectedDay, DateTime.now())
                          ? Colors.blue
                          : Colors.grey,
                      width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                defaultDecoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                weekendDecoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                weekendTextStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Editable availability field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _availabilityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Current Availability',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_availabilityController.text.isNotEmpty) {
                      int availability =
                          int.parse(_availabilityController.text);
                      if (_selectedDay != null) {
                        _updateAvailability(_selectedDay!, availability);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter a valid availability."),
                      ));
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Orders on selected date
            const Text(
              'Orders on Selected Date:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            // List of orders for the selected day
            Expanded(
              child: ListView.builder(
                itemCount: _selectedDayOrders.length,
                itemBuilder: (context, index) {
                  final order = _selectedDayOrders[index];
                  return orderCard(
                    orderId: order['orderId'],
                    cartItems: order['cartItems'],
                    customerName: order['customerName'],
                    contactNumber:
                        order['contactNumber'], // Added contact number
                    price: order['totalPrice'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderCard({
    required String orderId,
    required List<dynamic> cartItems,
    required String customerName,
    required String contactNumber, // Added contact number parameter
    required double price,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: $orderId',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Customer: $customerName'),
            Text('Contact Number: $contactNumber'), // Display contact number
            Text('Total Price: P$price',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // Loop through cart items and display each one
            ...cartItems.map((item) {
              String imagePath = item['imagepath'] ??
                  'assets/images/placeholder.png'; // Default image if no path
              String foodName =
                  item['CakeName'] ?? 'Unknown Cake'; // Default name if null

              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cake: $foodName',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
