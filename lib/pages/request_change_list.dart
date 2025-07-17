import 'package:flutter/material.dart';
import 'package:cheng/pages/request_change_message.dart';
// Import ChatMessagePage
// You need to create/import the ChatMessagePage class or file here
// import 'package:your_app/pages/chat_message_page.dart'; // <-- Update with actual path

class RequestChangeListPage extends StatefulWidget {
  const RequestChangeListPage({super.key});

  @override
  _RequestChangeListPageState createState() => _RequestChangeListPageState();
}

class _RequestChangeListPageState extends State<RequestChangeListPage> {
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
    // Navigate to the ChatMessagePage (Make sure ChatMessagePage exists)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RequestChangeMessagePage(userName: userName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Request List",
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
                            overflow:
                                TextOverflow.ellipsis, // Handle long messages
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

// Mock ChatMessagePage to ensure the code runs
class ChatMessagePage extends StatelessWidget {
  final String userName;

  const ChatMessagePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $userName'),
      ),
      body: Center(
        child: Text('Chat message screen for $userName'),
      ),
    );
  }
}
