import 'package:flutter/material.dart';
import '../components/order_tile.dart';
import 'request_change_page.dart';
import '../services/chat/request_change_service.dart';

class OrderListPage extends StatelessWidget {
  final String userId;
  final String email;
  final List<Map<String, dynamic>> orders;

  const OrderListPage({
    super.key,
    required this.userId,
    required this.email,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    final RequestChangeService requestChangeService = RequestChangeService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders for $email"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: orders.map((order) {
          String orderId = order['orderId'];
          String orderStatus = order['orderStatus'];
          double totalPrice = order['totalPrice'];
          bool isRead = order['isRead'] ?? false;

          return OrderTile(
            orderId: orderId,
            orderStatus: orderStatus,
            totalPrice: totalPrice,
            isRead: isRead,
            onTap: () async {
              // Mark messages as read for this order when navigating to RequestChangePage
              await requestChangeService.markMessagesAsRead(userId, orderId);

              // Navigate to RequestChangePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestChangePage(
                    receiverEmail: email,
                    receiverID: userId,
                    orderId: orderId,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
