import 'package:flutter/material.dart';
import 'package:cheng/pages/chat_message.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // Sample list of users for the chat list
  List<Map<String, String>> users = [
    {'name': 'Joshua M.', 'message': 'Good day, may I inquire about...'},
    {'name': 'Maxwell J.', 'message': 'Hello, I would like to...'},
    {'name': 'David Manalo', 'message': 'Good evening, may I inquire...'},
    {'name': 'Michael D.', 'message': 'Hello Aldriane, I would like to...'},
  ];

  // Function to handle chat item selection and navigate to ChatMessagePage
  void openChat(String userName) {
    print('Opening chat with: $userName');
    // Navigate to the ChatMessagePage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatMessagePage(userName: userName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            onTap: () {
              openChat(user['name']!); // Navigate to ChatMessagePage on tap
            },
            child: Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.white, // White background for the card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24, // Size of the avatar
                      backgroundColor: Colors.grey, // Placeholder color
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(
                        width: 16), // Spacing between avatar and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user['message']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors
                                  .grey, // Lighter color for the message preview
                            ),
                            overflow: TextOverflow
                                .ellipsis, // To handle long messages
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
