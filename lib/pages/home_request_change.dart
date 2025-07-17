import 'package:cheng/pages/home_page.dart';
import 'package:cheng/pages/order_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../components/user_tile.dart';
import '../services/chat/request_change_service.dart';

class HomeRequestChatPage extends StatefulWidget {
  const HomeRequestChatPage({super.key});

  @override
  _HomeRequestChatPageState createState() => _HomeRequestChatPageState();
}

class _HomeRequestChatPageState extends State<HomeRequestChatPage> {
  final RequestChangeService _requestChangeService = RequestChangeService();
  final AuthService _authService = AuthService();

  // To keep track of which user is currently expanded
  String? expandedUserId;

  // To refresh the state after reading all orders
  void refreshUserList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Change Lists"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: _buildUserList(),
    );
  }

  // Build a list of users and their orders
  Widget _buildUserList() {
    return FutureBuilder<String?>(
      future: _authService.getCurrentUserId(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error fetching user data.");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data != null) {
          String currentUserId = snapshot.data!;
          return StreamBuilder<List<Map<String, dynamic>>>(
            stream: _requestChangeService.getUsersWithOrdersStream(),
            builder: (context, userSnapshot) {
              if (userSnapshot.hasError) {
                print("Error fetching users: ${userSnapshot.error}");
                return const Text("Error");
              }

              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              List<Map<String, dynamic>> users = userSnapshot.data!
                  .where((userData) => userData['userId'] != currentUserId)
                  .toList();

              if (users.isEmpty) {
                return const Text("No users found.");
              }

              return ListView(
                children: users.map<Widget>((userData) {
                  return _buildUserListItem(userData, currentUserId, context);
                }).toList(),
              );
            },
          );
        }

        return const Text("Something went wrong. No user ID found.");
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, String currentUserId,
      BuildContext context) {
    String? email = userData["email"];
    String? userId = userData["userId"];
    List<Map<String, dynamic>> orders = userData["orders"];

    if (email == null || userId == null || orders.isEmpty) {
      return Container(); // Skip if data is incomplete
    }

    // Assuming we want the first order's unread status
    String orderId = orders.first['orderId'];

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _requestChangeService.getUnreadMessagesStream(userId, orderId),
      builder: (context, unreadSnapshot) {
        if (unreadSnapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(); // Loading indicator
        }

        if (unreadSnapshot.hasError) {
          print("Error fetching unread messages: ${unreadSnapshot.error}");
          return const SizedBox.shrink();
        }

        // Check if there are any unread messages
        bool hasUnreadMessages =
            unreadSnapshot.data != null && unreadSnapshot.data!.docs.isNotEmpty;

        return Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: UserTile(
            text: email,
            textStyle: TextStyle(
              fontWeight:
                  hasUnreadMessages ? FontWeight.bold : FontWeight.normal,
            ),
            color: Colors.lightBlue.shade100,
            hasUnreadMessages: hasUnreadMessages,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderListPage(
                    userId: userId,
                    email: email,
                    orders: orders,
                  ),
                ),
              ).then((_) {
                // Mark messages as read after returning from OrderListPage
                _requestChangeService.markMessagesAsRead(userId, orderId);
              });
            },
          ),
        );
      },
    );
  }
}
