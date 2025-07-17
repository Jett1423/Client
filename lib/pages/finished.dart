import 'package:cheng/models/food.dart';
import 'package:cheng/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:cheng/models/baker.dart';

class Finished extends StatefulWidget {
  const Finished({super.key});

  @override
  State<Finished> createState() => _FinishedState();
}

class _FinishedState extends State<Finished> {
  List<DocumentSnapshot> finishedOrders = [];
  final FirestoreService _firestoreService = FirestoreService();
  final Set<String> disabledButtons = {}; // Track disabled buttons by cake name

  @override
  void initState() {
    super.initState();
    _fetchFinishedOrders();
  }

  void _fetchFinishedOrders() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'completed')
        .get();

    setState(() {
      finishedOrders = querySnapshot.docs;
    });
  }

  Future<bool> _checkCakeInCustomCollection(String cakeName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('custom')
        .where('CakeName', isEqualTo: cakeName)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> _handleAddToCustomCollection(
      Map<String, dynamic> cakeItem) async {
    try {
      await _firestoreService.addToCustomCollection(cakeItem);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cake item added to custom collection.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to add cake item.")),
      );
    }
  }

  final Baker baker = Baker();

  String getModelPathByName(String cakeName) {
    try {
      final Food foodItem = baker.menu.firstWhere(
        (food) => food.name == cakeName,
      );
      return foodItem.modelpath;
    } catch (e) {
      // Return a default path or handle gracefully if no item is found
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Orders'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: finishedOrders.isEmpty
          ? const Center(child: Text('No completed orders found.'))
          : ListView.builder(
              itemCount: finishedOrders.length,
              itemBuilder: (context, index) {
                final order = finishedOrders[index];
                final orderId = order['orderId'];
                final customerName = order['customerName'];
                final totalPrice = order['totalPrice'];
                final orderDate = (order['date'] as Timestamp).toDate();
                final List<dynamic> cartItems = order['cartItems'];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order ID: $orderId',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Customer: $customerName'),
                        Text('Total Price: P$totalPrice'),
                        Text(
                            'Date: ${DateFormat.yMMMd().add_jm().format(orderDate)}'),
                        const SizedBox(height: 8),
                        ...cartItems.map((item) {
                          final String cakeName = item['CakeName'] ?? 'Unknown';
                          final String imagePath = item['imagepath'] ?? '';
                          final int quantity = item['quantity'] ?? 0;
                          final double price = item['price'] ?? 0;
                          final String description = item['description'] ?? '';
                          final List<dynamic> addons = item['addons'] ?? [];

                          // Get the modelpath from the map in baker.dart
                          final String modelpath = getModelPathByName(cakeName);

                          return FutureBuilder<bool>(
                            future: _checkCakeInCustomCollection(cakeName),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              final bool cakeExists = snapshot.data ?? false;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      imagePath.isNotEmpty
                                          ? Image.asset(
                                              imagePath,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(
                                              Icons.image_not_supported,
                                              size: 50,
                                            ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Cake name: $cakeName'),
                                            Text('Quantity: $quantity'),
                                            Text(
                                                'Addons: ${addons.isEmpty ? 'None' : addons.join(", ")}'),
                                            Text('Price: P$price'),
                                            if (cakeName.contains("Customized"))
                                              cakeExists
                                                  ? const Text(
                                                      "This cake has already been added in the custom collection",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    )
                                                  : ElevatedButton(
                                                      onPressed: () async {
                                                        await _handleAddToCustomCollection({
                                                          ...item,
                                                          'modelpath':
                                                              modelpath,
                                                        });
                                                        setState(() {
                                                          disabledButtons
                                                              .add(cakeName);
                                                        });
                                                      },
                                                      child: const Text(
                                                          "Add to Custom Collection"),
                                                    ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
