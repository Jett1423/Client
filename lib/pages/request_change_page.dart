import 'package:cheng/pages/changes_form.dart';
import 'package:flutter/material.dart';
import '../services/chat/request_change_service.dart';
import '../services/auth/auth_service.dart';
import 'package:cheng/components/my_textfield.dart';

import 'package:cheng/components/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestChangePage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  final String orderId; // Added orderId parameter

  const RequestChangePage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
    required this.orderId, // Initialize the orderId
  });

  @override
  State<RequestChangePage> createState() => _RequestChangePageState();
}

class _RequestChangePageState extends State<RequestChangePage> {
  final TextEditingController _messageController = TextEditingController();
  final RequestChangeService _requestChangeService = RequestChangeService();
  final AuthService _authService = AuthService();
  FocusNode myFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final Map<String, bool> _actionTaken =
      {}; // Track action taken per change type

  @override
  void initState() {
    super.initState();

    // Mark messages as read when the request change page is opened
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

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  // Mark messages as read when the request change page is opened
  void _markMessagesAsRead() async {
    await _requestChangeService.markMessagesAsRead(
        widget.receiverID, widget.orderId);
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      String? currentUserId = await _authService.getCurrentUserId();
      bool isAdmin = await _authService.isAdmin();

      if (currentUserId != null) {
        String receiverID =
            isAdmin ? widget.receiverID : await _getAdminUserId();
        await _requestChangeService.sendMessage(
            receiverID, _messageController.text, currentUserId, widget.orderId);

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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          FutureBuilder<bool>(
            future: _authService.isAdmin(),
            builder: (context, isAdminSnapshot) {
              if (isAdminSnapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(); // Show nothing while checking admin status
              }

              bool isAdmin = isAdminSnapshot.data ?? false;
              if (!isAdmin) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Align to the right
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangesFormPage(
                                receiverID: widget.receiverID,
                                orderId: widget.orderId,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit, color: Colors.white),
                        label: const Text(
                          'Get Changes Form',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(150, 40),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
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
            stream: _requestChangeService.getMessages(
                senderID, widget.receiverID, widget.orderId),
            builder: (context, messageSnapshot) {
              List<Widget> messageWidgets = [];

              // Add the FAQ box as the first item
              messageWidgets.add(_buildFaqBox());

              // Add spacing between the FAQ box and the messages
              messageWidgets.add(const SizedBox(height: 16));

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
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('orders')
          .doc(widget.orderId)
          .get(),
      builder: (context, orderSnapshot) {
        if (!orderSnapshot.hasData) {
          return const SizedBox();
        }

        if (orderSnapshot.hasError) {
          print("Error fetching order details: ${orderSnapshot.error}");
          return const Text("Error fetching order details.");
        }

        if (!orderSnapshot.data!.exists) {
          return const Text("Order not found.");
        }

        Map<String, dynamic> orderData =
            orderSnapshot.data!.data() as Map<String, dynamic>;

        return FutureBuilder<bool>(
          future: _authService.isAdmin(), // Check if the user is an admin
          builder: (context, isAdminSnapshot) {
            if (!isAdminSnapshot.hasData) {
              return const SizedBox(); // Wait until admin status is determined
            }

            bool isAdmin = isAdminSnapshot.data!;

            return Align(
              alignment: isAdmin ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
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
                      "Order information: \n\nTo request changes, please get the request change form. Note that some changes may affect the total price.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    // Display each cart item as an individual FAQ item
                    ...orderData['cartItems'].map<Widget>((item) {
                      return _buildFaqItemForCartItem(item);
                    }).toList(),
                    // Display other individual fields as separate FAQ items
                    _buildFaqItem(
                        "Customer Name", orderData['customerName'] ?? 'N/A'),
                    _buildFaqItem(
                        "Contact Number", orderData['contactNumber'] ?? 'N/A'),
                    _buildFaqItem("Order Date", _formatDate(orderData['date'])),
                    _buildFaqItem("Time", orderData['time'] ?? 'N/A'),
                    _buildFaqItem(
                        "Total Price", "P${orderData['totalPrice'] ?? '0.0'}"),
                    _buildFaqItem("Address", orderData['address'] ?? 'N/A'),
                    _buildFaqItem("Mode of Delivery",
                        orderData['deliveryOption'] ?? 'N/A'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _formatDate(Timestamp? timestamp) {
    if (timestamp == null) return 'N/A';
    DateTime date = timestamp.toDate();
    return "${date.day} ${_getMonthName(date.month)} ${date.year}";
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  Widget _buildFaqItemForCartItem(Map<String, dynamic> itemData) {
    String cakeName = itemData['CakeName'] ?? 'Unknown';
    dynamic addons = itemData['addons'] ?? 'None';
    double price = itemData['price'] ?? 0.0;
    int quantity = itemData['quantity'] ?? 1;

    String addonsText;
    if (addons is List) {
      addonsText = addons.join(', ');
    } else {
      addonsText = addons.toString();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$cakeName (Qty: $quantity, Price: P$price)",
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text("Add-ons: $addonsText",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        "$label: $value",
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

// Helper function to capitalize the first letter of a string
  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  Widget _buildMessageItem(Map<String, dynamic> data, bool isCurrentUser) {
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    String message = data["message"];
    String? status = data['status']; // Check if a decision status exists

    // Check if the message is a change request
    if (message.startsWith("Request Changes:")) {
      List<String> messageParts = message.split('\n---\n');
      String changeType = messageParts.isNotEmpty
          ? messageParts[0].replaceFirst("Request Changes:\n\n", "")
          : "Unknown";
      String customerInput = messageParts.length > 1 ? messageParts[1] : "";

      bool hasActionBeenTaken = status != null; // Check if status is set

      return Align(
        alignment: alignment,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Request Changes:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              _buildFaqItem("Change Type", changeType.trim()),
              _buildFaqItem("Details", customerInput.trim()),
              if (!isCurrentUser)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: hasActionBeenTaken
                          ? null
                          : () {
                              _handleApproval(changeType, customerInput);
                              setState(() {
                                _actionTaken[changeType] = true;
                              });
                            },
                      child: Text(
                        "Approve",
                        style: TextStyle(
                          color:
                              hasActionBeenTaken ? Colors.grey : Colors.green,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: hasActionBeenTaken
                          ? null
                          : () {
                              _handleDisapproval(changeType, customerInput);
                              setState(() {
                                _actionTaken[changeType] = true;
                              });
                            },
                      child: Text(
                        "Disapprove",
                        style: TextStyle(
                          color: hasActionBeenTaken ? Colors.grey : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              if (hasActionBeenTaken) // Display the status if action was taken
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Status: ${capitalize(status!)}", // Use the capitalize function
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: status == 'approved' ? Colors.green : Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    // Regular chat message (not a change request)
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

  void _handleApproval(String changeType, String customerInput) async {
    try {
      String currentUserId = await _authService.getCurrentUserId() ?? '';
      List<String> ids = [currentUserId, widget.receiverID];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Update the status in the specific message in `request_rooms`
      QuerySnapshot messageSnapshot = await FirebaseFirestore.instance
          .collection('request_rooms')
          .doc(chatRoomID)
          .collection(widget.orderId)
          .where('message',
              isEqualTo: "Request Changes:\n\n$changeType\n---\n$customerInput")
          .limit(1)
          .get();

      if (messageSnapshot.docs.isNotEmpty) {
        await messageSnapshot.docs.first.reference
            .update({'status': 'approved'});

        // Update the corresponding field in the `orders` collection
        final changeFields = {
          'Mode of Delivery': 'deliveryOption',
          'Address': 'address',
          'Order Date': 'date',
          'Time': 'time',
          'Customer Name': 'customerName',
          'Addons': 'addons',
          'Cake item': 'cakeItem',
          'Contact Number': 'contactNumber',
          'Quantity': 'quantity',
        };

        String? firestoreField = changeFields[changeType];
        if (firestoreField != null) {
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(widget.orderId)
              .update({firestoreField: customerInput});
        }

        await _requestChangeService.sendMessage(
          widget.receiverID,
          "Your requested change for '$changeType' has been approved by the admin.",
          currentUserId,
          widget.orderId,
        );

        setState(() {
          _actionTaken[changeType] = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('$changeType approved and updated successfully!')),
        );
      }
    } catch (e) {
      print("Error updating Firestore: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to approve change.')),
      );
    }
  }

  void _handleDisapproval(String changeType, String customerInput) async {
    try {
      String currentUserId = await _authService.getCurrentUserId() ?? '';
      List<String> ids = [currentUserId, widget.receiverID];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Update the status in the specific message in `request_rooms`
      QuerySnapshot messageSnapshot = await FirebaseFirestore.instance
          .collection('request_rooms')
          .doc(chatRoomID)
          .collection(widget.orderId)
          .where('message',
              isEqualTo: "Request Changes:\n\n$changeType\n---\n$customerInput")
          .limit(1)
          .get();

      if (messageSnapshot.docs.isNotEmpty) {
        await messageSnapshot.docs.first.reference
            .update({'status': 'disapproved'});

        await _requestChangeService.sendMessage(
          widget.receiverID,
          "Your requested change for '$changeType' has been disapproved by the admin.",
          currentUserId,
          widget.orderId,
        );

        setState(() {
          _actionTaken[changeType] = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$changeType disapproved.')),
        );
      }
    } catch (e) {
      print("Error sending disapproval message: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to disapprove change.')),
      );
    }
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
