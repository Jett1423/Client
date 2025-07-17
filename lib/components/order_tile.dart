import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;
  final String orderStatus;
  final double totalPrice;
  final VoidCallback onTap;
  final bool isRead; // New parameter to track if the order has been read

  const OrderTile({
    super.key,
    required this.orderId,
    required this.orderStatus,
    required this.totalPrice,
    required this.onTap,
    required this.isRead, // Initialize the new parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0, vertical: 12.0), // Match padding
        margin: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 8.0), // Match margin
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade100, // Match UserTile's color
          borderRadius: BorderRadius.circular(8.0), // Match the border radius
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: $orderId',
              style: TextStyle(
                fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                fontSize: 16,
                color: isRead ? Colors.grey : Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Status: ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextSpan(
                    text: orderStatus,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Total: ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'P${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
