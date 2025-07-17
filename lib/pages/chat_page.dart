import 'package:flutter/material.dart';
import '../services/chat/chat_service.dart';
import '../services/auth/auth_service.dart';
import 'package:cheng/components/my_textfield.dart';
import 'package:cheng/components/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  const ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Text controller
  final TextEditingController _messageController = TextEditingController();

  // Chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // For text field focus
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Mark messages as read when the chat page is opened
    _markMessagesAsRead();

    // Add listener to focus node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });

    // Wait a bit for ListView to be built, then scroll to bottom
    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Scroll controller
  final ScrollController _scrollController = ScrollController();

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  // Mark messages as read when the chat page is opened
  void _markMessagesAsRead() async {
    await _chatService.markMessagesAsRead(widget.receiverID);
  }

  // Send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      String? currentUserId = await _authService.getCurrentUserId();
      bool isAdmin = await _authService.isAdmin();

      if (currentUserId != null) {
        String receiverID =
            isAdmin ? widget.receiverID : await _getAdminUserId();
        await _chatService.sendMessage(
            receiverID, _messageController.text, currentUserId);
        _messageController.clear();
      } else {
        print("Error: Could not retrieve the current user ID.");
      }

      scrollDown();
    }
  }

  Future<String> _getAdminUserId() async {
    Map<String, dynamic>? adminDetails = await _authService.getAdminDetails();
    if (adminDetails != null && adminDetails['userId'] != null) {
      return adminDetails['userId'];
    } else {
      throw Exception("Admin details not found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return FutureBuilder<String?>(
      future: _authService.getCurrentUserId(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Error fetching user ID: ${snapshot.error}");
          return const Text("Error fetching user ID.");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        if (snapshot.hasData && snapshot.data != null) {
          String senderID = snapshot.data!;
          return StreamBuilder<QuerySnapshot>(
            stream: _chatService.getMessages(senderID, widget.receiverID),
            builder: (context, messageSnapshot) {
              List<Widget> messageWidgets = [];

              // Add the FAQ box as the first item
              messageWidgets.add(_buildFaqBox());

              // Check if chat messages exist and add them to the list
              if (messageSnapshot.hasData &&
                  messageSnapshot.data!.docs.isNotEmpty) {
                messageWidgets.addAll(
                  messageSnapshot.data!.docs.map((doc) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    bool isCurrentUser = data['senderID'] == senderID;
                    return _buildMessageItem(data, isCurrentUser);
                  }).toList(),
                );
              }

              return ListView(
                controller: _scrollController,
                children: messageWidgets,
              );
            },
          );
        }

        return const Text("Something went wrong. No user ID found.");
      },
    );
  }

  Widget _buildFaqBox() {
    return Align(
      alignment: Alignment
          .centerLeft, // Align the box to the left, like a received message
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75, // Limit max width
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Hi! Due to high volume of messages, we may not be able to immediately reply to you. ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('faqs').snapshots(),
              builder: (context, faqSnapshot) {
                if (!faqSnapshot.hasData) {
                  return const Text("Loading FAQs...");
                }

                if (faqSnapshot.data!.docs.isEmpty) {
                  return const Text("No FAQs available.");
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: faqSnapshot.data!.docs.map((faq) {
                    String question = faq['question'];
                    String answer =
                        faq['answer']; // Fetch the answer from the document
                    return _buildFaqItem(question, answer);
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return GestureDetector(
      onTap: () {
        // When an FAQ item is clicked, send the question and the answer
        _sendFaqMessage(question, answer);
      },
      child: Container(
        width: double
            .infinity, // Make the container take up the full width of its parent
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            question,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _sendFaqMessage(String question, String answer) async {
    String? currentUserId = await _authService.getCurrentUserId();
    bool isAdmin = await _authService.isAdmin();

    if (currentUserId != null) {
      String receiverID = isAdmin ? widget.receiverID : await _getAdminUserId();

      // Send the question as if the user sent it
      await _chatService.sendMessage(receiverID, question, currentUserId);

      // Scroll down to show the question
      scrollDown();

      // Simulate a short delay before sending the answer as a received message
      Future.delayed(const Duration(milliseconds: 500), () async {
        await _chatService.sendMessage(currentUserId, answer,
            receiverID); // Send the answer from "receiver"
        scrollDown();
      });
    } else {
      print("Error: Could not retrieve the current user ID.");
    }
  }

  Widget _buildMessageItem(Map<String, dynamic> data, bool isCurrentUser) {
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data["message"],
            isCurrentUser: isCurrentUser,
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextfield(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
              focusNode: myFocusNode,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
