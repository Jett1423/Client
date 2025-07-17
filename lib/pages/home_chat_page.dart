import 'package:cheng/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';
import '../components/user_tile.dart';
import '../pages/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeChatPage extends StatelessWidget {
  HomeChatPage({super.key});

  // Chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Lists"),
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
      ), // AppBarar
      body: _buildUserList(),
    ); // Scaffold
  }

  // Build a list of users except for the current logged-in user, and only if they have messaged the admin
  Widget _buildUserList() {
    return FutureBuilder<String?>(
      future: _authService.getCurrentUserId(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error fetching user data.");
        }

        // Show loading while waiting for userId
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        // When we have the userId
        if (snapshot.hasData && snapshot.data != null) {
          String currentUserId = snapshot.data!;
          return StreamBuilder<List<Map<String, dynamic>>>(
            stream: _chatService.getUsersStream(),
            builder: (context, userSnapshot) {
              if (userSnapshot.hasError) {
                print("Error fetching users: ${userSnapshot.error}");
                return const Text("Error");
              }

              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              // Filter users to exclude the current user (admin) and show only customers who have messages with the admin
              List<Map<String, dynamic>> users = userSnapshot.data!
                  .where((userData) => userData['userId'] != currentUserId)
                  .toList();

              if (users.isEmpty) {
                return const Text("No users found.");
              }

              return ListView(
                children: users
                    .map<Widget>((userData) =>
                        _buildUserListItem(userData, currentUserId, context))
                    .toList(),
              ); // ListView
            },
          );
        }

        // If snapshot has no data or userId is null
        return const Text("Something went wrong. No user ID found.");
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, String currentUserId,
      BuildContext context) {
    String? firstName = userData["firstname"];
    String? lastName = userData["lastname"];
    String? userId = userData["userId"];

    // Concatenate full name, or skip if any data is missing
    if (firstName == null || lastName == null || userId == null) {
      return Container(); // Skip if data is incomplete
    }

    String fullName = "$firstName $lastName";

    return FutureBuilder<bool>(
      future: _chatService.hasMessagesWithAdmin(userId),
      builder: (context, messageSnapshot) {
        if (messageSnapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(); // Loading indicator
        }

        if (messageSnapshot.hasError || !messageSnapshot.hasData) {
          print("Error checking messages with admin: ${messageSnapshot.error}");
          return const SizedBox.shrink();
        }

        bool hasMessages = messageSnapshot.data!;

        if (hasMessages) {
          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _chatService.getUnreadMessagesStream(userId),
            builder: (context, unreadSnapshot) {
              if (unreadSnapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox.shrink(); // Loading indicator
              }

              if (unreadSnapshot.hasError) {
                print(
                    "Error checking unread messages with admin: ${unreadSnapshot.error}");
                return const SizedBox.shrink();
              }

              bool hasUnreadMessages = unreadSnapshot.data != null &&
                  unreadSnapshot.data!.docs.isNotEmpty;

              return Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: UserTile(
                  text: fullName, // Use fullName instead of email
                  textStyle: TextStyle(
                    fontWeight:
                        hasUnreadMessages ? FontWeight.bold : FontWeight.normal,
                  ),
                  color:
                      Colors.lightBlue.shade100, // Set tile color to light blue
                  hasUnreadMessages: hasUnreadMessages,
                  onTap: () async {
                    if (hasUnreadMessages) {
                      // Logic to decrement unread count if necessary
                    }

                    await _chatService.markMessagesAsRead(userId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          receiverEmail:
                              fullName, // Use fullName here as well if needed
                          receiverID: userId,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink(); // Hide user if no messages
        }
      },
    );
  }
}
