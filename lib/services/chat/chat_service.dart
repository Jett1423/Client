import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
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

  // Get a stream of users from Firestore
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  Stream<int> getUnreadUsersCountStream() {
    return _firestore
        .collection('users')
        .snapshots()
        .asyncMap((snapshot) async {
      int count = 0;

      for (var userDoc in snapshot.docs) {
        String userId = userDoc['userId'];
        bool hasUnread = await hasUnreadMessagesWithAdmin(userId);
        if (hasUnread) {
          count++;
        }
      }
      return count;
    });
  }

  // Check if a user has unread messages with the admin
  Future<bool> hasUnreadMessagesWithAdmin(String userId) async {
    String adminId = '01'; // Hardcoded admin userId

    try {
      // Construct chat room ID between the user and admin
      List<String> ids = [adminId, userId];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Check if any unread messages exist in this chat room
      QuerySnapshot messageSnapshot = await _firestore
          .collection('chat_rooms')
          .doc(chatRoomID)
          .collection('messages')
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getUnreadMessagesStream(
      String userId) {
    String adminId = '01'; // Hardcoded admin userId

    List<String> ids = [adminId, userId];
    ids.sort();
    String chatRoomID = ids.join('_');

    // Return the stream directly without using `withConverter`
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .where('receiverID', isEqualTo: adminId)
        .where('isRead', isEqualTo: false)
        .snapshots();
  }

  // Mark all messages as read when admin opens the chat
  Future<void> markMessagesAsRead(String userId) async {
    String adminId = '01'; // Hardcoded admin userId

    try {
      // Construct chat room ID between the user and admin
      List<String> ids = [adminId, userId];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Fetch all unread messages for this chat room where the admin is the receiver
      QuerySnapshot messageSnapshot = await _firestore
          .collection('chat_rooms')
          .doc(chatRoomID)
          .collection('messages')
          .where('receiverID', isEqualTo: adminId)
          .where('isRead', isEqualTo: false)
          .get();

      // Update each message document to mark it as read
      for (var doc in messageSnapshot.docs) {
        await doc.reference.update({'isRead': true});
      }
    } catch (e) {
      print("Error marking messages as read: $e");
    }
  }

  // Send message using userId
  Future<void> sendMessage(
      String receiverID, String message, String senderID) async {
    final Timestamp timestamp = Timestamp.now();

    // Create a new message including the receiver's ID and sender's ID
    Map<String, dynamic> newMessage = {
      'senderID': senderID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp,
      'isRead': false, // Initially, the message is unread
    };

    // Construct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids = [senderID, receiverID];
    ids.sort(); // Ensure the chatRoomID is the same for any 2 people
    String chatRoomID = ids.join('_');

    try {
      // Use the _firestore instance properly here
      await _firestore
          .collection('chat_rooms')
          .doc(chatRoomID)
          .collection('messages')
          .add(newMessage);
      print("Message sent successfully.");
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  // Check if there are existing messages between admin and a user
  Future<bool> hasMessagesWithAdmin(String userId) async {
    String adminId = '01'; // Hardcoded admin userId

    try {
      // Construct chat room ID between the user and admin
      List<String> ids = [adminId, userId];
      ids.sort();
      String chatRoomID = ids.join('_');

      // Check if any messages exist in this chat room
      QuerySnapshot messageSnapshot = await _firestore
          .collection('chat_rooms')
          .doc(chatRoomID)
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

  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID =
        ids.join('_'); // Ensure the chatRoomID is unique for both users

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false) // Order messages by timestamp
        .snapshots();
  }
}
