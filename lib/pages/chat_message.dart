import 'package:flutter/material.dart';

class ChatMessagePage extends StatefulWidget {
  final String userName;

  const ChatMessagePage({super.key, required this.userName});

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  // List to store the chat messages
  List<Map<String, dynamic>> messages = [
    {'text': 'hi ronaldo!', 'isSent': false},
    {'text': 'hi again', 'isSent': false},
    {'text': 'okok', 'isSent': false},
    {'text': 'finally finished tutorial!!!', 'isSent': false},
    {'text': 'hi flutter!', 'isSent': true},
  ];

  // Text editing controller for input field
  final TextEditingController _messageController = TextEditingController();

  // Function to send a new message
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': _messageController.text,
          'isSent': true, // True for sent message
        });
        _messageController.clear(); // Clear the text field after sending
      });
    }
  }

  // Function to handle file upload
  void _uploadFile() {
    // Here you would implement file upload logic
    print('Upload button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
        backgroundColor: Colors.blue, // Blue theme for AppBar
      ),
      backgroundColor: Colors.white, // White background for the chat screen
      body: Column(
        children: [
          // Expanded widget to show chat history
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['isSent']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: message['isSent']
                          ? Colors.blue[400] // Sent messages (blue background)
                          : Colors.grey[200], // Received messages (light gray)
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message['text'],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          // Input area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Upload button (on the left)
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  color: Colors.blue, // Blue color for upload button
                  onPressed: _uploadFile, // Handle file upload
                ),
                const SizedBox(width: 8),
                // Expanded Text Field to type messages
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Type your message...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Blue border for input field
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Blue border when not focused
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Blue border when focused
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Send button (on the right)
                GestureDetector(
                  onTap: _sendMessage,
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue, // Blue color for send button
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
