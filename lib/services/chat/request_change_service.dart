import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestChangeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get the userId from your 'users' collection using the Firebase uid
  Future<String?> getUserId() async {
    User? user = _auth.currentUser; // Get the current user
    if (user != null) {
      try {
        // Query Firestore based on the user's email to get their incremented userId
        QuerySnapshot querySnapshot = await _firestore
            .collection('users')
            .where('email', isEqualTo: user.email)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Return the incremented userId from the document
          return querySnapshot.docs.first['userId'];
        } else {
          print("No user document found for email: ${user.email}");
          return null;
        }
      } catch (e) {
        print("Error fetching userId: $e");
        return null;
      }
    } else {
      print("No authenticated user.");
      return null;
    }
  }

// RequestChangeService

  Future<bool> hasUnreadMessages(String userId) async {
    String adminId = '01'; // Hardcoded admin userId
    bool hasUnread = false;

    try {
      // Check all orders for unread messages with the admin for this user
      var ordersSnapshot = await _firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .get();

      for (var orderDoc in ordersSnapshot.docs) {
        String orderId = orderDoc.id;
        bool hasUnreadForOrder =
            await hasUnreadMessagesWithAdmin(userId, orderId);

        if (hasUnreadForOrder) {
          hasUnread = true;
          break;
        }
      }
    } catch (e) {
      print("Error checking unread messages: $e");
    }
    return hasUnread;
  }

  // Method to fetch users along with their orders
  Stream<List<Map<String, dynamic>>> getUsersWithOrdersStream() async* {
    var userStream = _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        var data = doc.data();
        return {
          'userId': data['userId'],
          'email': data['email'],
        };
      }).toList();
    });

    await for (var users in userStream) {
      // Fetch orders for all users concurrently using Future.wait
      List<Future<Map<String, dynamic>>> futures = users.map((user) async {
        String userId = user['userId'];
        var ordersSnapshot = await _firestore
            .collection('orders')
            .where('userId', isEqualTo: userId)
            .get();

        List<Map<String, dynamic>> ordersWithMessages = await Future.wait(
          ordersSnapshot.docs.map((doc) async {
            var orderData = doc.data();
            String orderId = orderData['orderId'];

            // Check if there are messages for this order
            List<String> ids = ['01', userId]; // Assuming '01' is the admin ID
            ids.sort();
            String chatRoomID = ids.join('_');

            var messageSnapshot = await _firestore
                .collection('request_rooms')
                .doc(chatRoomID)
                .collection(orderId)
                .limit(1)
                .get();

            if (messageSnapshot.docs.isNotEmpty) {
              return {
                'orderId': orderId,
                'orderStatus': orderData['orderStatus'],
                'totalPrice': orderData['totalPrice'],
              };
            }
            return <String, dynamic>{}; // Return an empty map if no messages
          }).toList(),
        );

        // Filter out empty orders and return the user with their orders
        ordersWithMessages.removeWhere((order) => order.isEmpty);
        if (ordersWithMessages.isNotEmpty) {
          user['orders'] = ordersWithMessages;
          return user;
        }
        return <String,
            dynamic>{}; // Return an empty map if no orders with messages
      }).toList();

      // Wait for all user futures to complete and filter out empty users
      List<Map<String, dynamic>> usersWithMessages = await Future.wait(futures);
      usersWithMessages.removeWhere((user) => user.isEmpty);

      yield usersWithMessages;
    }
  }

  // Fetch orders that have changes for a specific user
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrdersWithChanges(
      String userId) {
    return _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .where('hasChanges',
            isEqualTo:
                true) // Make sure the field name matches your Firestore setup
        .snapshots();
  }

  Future<List<Map<String, dynamic>>> getOrdersForUserWithChanges(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .where('orderStatus', whereIn: [
        'requested change',
        'waiting for approval'
      ]) // Adjust this condition based on your app logic
          .get();

      return querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      print("Error fetching orders for user with changes: $e");
      return [];
    }
  }

  // Method to get a stream of users
  // Get a stream of users from Firestore
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  // Send message using userId with isRead field included
  Future<void> sendMessage(String receiverID, String message, String senderID,
      String orderId) async {
    final Timestamp timestamp = Timestamp.now();

    // Include 'isRead' field when sending a message
    Map<String, dynamic> newMessage = {
      'senderID': senderID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp,
      'isRead': false, // Add this field to track read status
    };

    List<String> ids = [senderID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    try {
      await _firestore
          .collection('request_rooms')
          .doc(chatRoomID)
          .collection(orderId) // Use the orderId as a collection for each order
          .doc()
          .set(newMessage);
      print("Message sent successfully.");
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  // Stream to get the count of users with unread request changes
  Stream<int> getUnreadRequestChangesCountStream() {
    String adminId = '01'; // Assuming '01' is the admin user ID

    return _firestore
        .collection('users')
        .snapshots()
        .asyncMap((snapshot) async {
      int unreadCount = 0;

      for (var userDoc in snapshot.docs) {
        String userId = userDoc['userId'];
        // Check each user for unread messages in each order
        var ordersSnapshot = await _firestore
            .collection('orders')
            .where('userId', isEqualTo: userId)
            .get();

        for (var orderDoc in ordersSnapshot.docs) {
          String orderId = orderDoc.id;
          bool hasUnread = await hasUnreadMessagesWithAdmin(userId, orderId);
          if (hasUnread) {
            unreadCount++;
            break; // Break if any unread messages are found for the user
          }
        }
      }
      return unreadCount;
    });
  }

  // Check if a user has unread messages with the admin for a specific order
  Future<bool> hasUnreadMessagesWithAdmin(String userId, String orderId) async {
    String adminId = '01'; // Hardcoded admin userId

    try {
      // Construct chat room ID between the user and admin
      List<String> ids = [adminId, userId];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Check if any unread messages exist in this chat room for the specific order
      QuerySnapshot messageSnapshot = await _firestore
          .collection('request_rooms')
          .doc(chatRoomID)
          .collection(orderId)
          .where('receiverID', isEqualTo: adminId)
          .where('isRead', isEqualTo: false)
          .limit(1)
          .get();

      // Return true if there are unread messages, false otherwise
      return messageSnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking unread messages with admin: $e");
      return false;
    }
  }

  // Get a stream of unread messages between the user and admin for a specific order
  // Stream to check if there are unread messages for a specific user in the request change feature
  Stream<QuerySnapshot<Map<String, dynamic>>> getUnreadMessagesStream(
      String userId, String orderId) {
    String adminId = '01'; // Hardcoded admin userId
    List<String> ids = [adminId, userId];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection('request_rooms')
        .doc(chatRoomID)
        .collection(orderId) // Order-based collection
        .where('receiverID', isEqualTo: adminId)
        .where('isRead', isEqualTo: false)
        .snapshots();
  }

  // Mark all messages as read when admin opens the chat for a specific order
  Future<void> markMessagesAsRead(String userId, String orderId) async {
    String adminId = '01'; // Assuming '01' is the admin user ID

    try {
      List<String> ids = [adminId, userId];
      ids.sort();
      String chatRoomID = ids.join('_');

      QuerySnapshot messageSnapshot = await _firestore
          .collection('request_rooms')
          .doc(chatRoomID)
          .collection(orderId)
          .where('receiverID', isEqualTo: adminId)
          .where('isRead', isEqualTo: false)
          .get();

      for (var doc in messageSnapshot.docs) {
        await doc.reference.update({'isRead': true});
      }
    } catch (e) {
      print("Error marking messages as read: $e");
    }
  }

  // Check if there are existing messages between admin and a user for a specific order
  Future<bool> hasMessagesWithAdmin(String userId, String orderId) async {
    String adminId = '01'; // Hardcoded admin userId

    try {
      // Construct chat room ID between the user and admin for a specific order
      List<String> ids = [adminId, userId];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Check if any messages exist in this chat room for the specific orderId
      QuerySnapshot messageSnapshot = await _firestore
          .collection('request_rooms')
          .doc(chatRoomID)
          .collection('orders')
          .doc(orderId)
          .collection('messages')
          .limit(1) // We only need to check if there's at least one message
          .get();

      // Return true if there are messages, false otherwise
      return messageSnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking messages with admin: $e");
      return false;
    }
  }

  // Fetch messages for a specific chat room and order
  Stream<QuerySnapshot> getMessages(
      String userID, String otherUserID, String orderId) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID =
        ids.join('_'); // Ensure the chatRoomID is unique for both users

    return _firestore
        .collection("request_rooms")
        .doc(chatRoomID)
        .collection(orderId)
        .orderBy("timestamp", descending: false) // Order messages by timestamp
        .snapshots();
  }
}
