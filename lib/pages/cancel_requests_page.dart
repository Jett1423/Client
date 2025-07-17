import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CancelRequestsPage extends StatelessWidget {
  const CancelRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel Requests',
            style: TextStyle(color: Colors.white)),
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                // Fetch orders with status 'waiting for cancellation approval'
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where('orderStatus',
                        isEqualTo: 'waiting for cancellation approval')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final orders = snapshot.data!.docs;

                  if (orders.isEmpty) {
                    return const Center(
                      child:
                          Text('No orders waiting for cancellation approval.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return orderCard(
                        context: context,
                        orderId: order['orderId'],
                        cartItems:
                            order['cartItems'], // Pass the cartItems list
                        customerName: order['customerName'],
                        price: order['totalPrice'],
                        docId: order.id, // Document ID for Firestore updates
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display each order card with PopupMenuButton
  Widget orderCard({
    required BuildContext context,
    required String orderId,
    required List<dynamic> cartItems, // Accept the cartItems list here
    required String customerName,
    required double price,
    required String docId, // Pass document ID for Firestore update
  }) {
    // Join all cake names from cartItems
    String cakeNames = cartItems.map((item) => item['CakeName']).join(', ');

    // Get all image paths from the cartItems or use a default image if not available
    List<String> imagePaths = cartItems.isNotEmpty
        ? cartItems
            .map((item) => (item['imagepath'] != null
                ? item['imagepath'].toString()
                : 'assets/images/default_image.png'))
            .toList()
        : [
            'assets/images/default_image.png'
          ]; // Default image path if no images are found

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2), // Blue border
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(10.0), // Adding padding for better spacing
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align items to the top
          children: [
            // Display multiple images (only showing up to 2 in this example)
            Column(
              children: imagePaths.take(2).map((path) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      path,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/default_image.png', // Fallback image
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10), // Add space between image and details
            Expanded(
              // Allow text to take the remaining space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: $orderId',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Cake names: $cakeNames'), // Display cake names from cartItems
                  Text('Customer: $customerName'),
                  const SizedBox(height: 8), // Add space before the price
                  Text(
                    'Total Price: P$price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Cancel') {
                  _cancelOrder(context, docId); // Call cancel function
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'Cancel',
                    child: Text('Cancel order'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle cancel order
  void _cancelOrder(BuildContext context, String docId) async {
    try {
      // Update the order status in Firestore to 'cancelled'
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(docId)
          .update({'orderStatus': 'cancelled'});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order has been cancelled successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to cancel order: $e')),
      );
    }
  }
}
