import 'package:firebase_auth/firebase_auth.dart';
import 'package:cheng/models/baker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  // Instance of Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // The admin email (could be fetched dynamically from Firestore as well if needed)
  final String adminEmail =
      'asis@gmail.com'; // Replace with your actual admin email

  // Get current authenticated user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Fetch admin details from the 'admin' collection (optional)
  Future<Map<String, dynamic>?> getAdminDetails() async {
    try {
      DocumentSnapshot adminSnapshot =
          await _firestore.collection('admin').doc('01').get();
      if (adminSnapshot.exists) {
        return adminSnapshot.data() as Map<String, dynamic>;
      } else {
        print("Admin document not found.");
      }
    } catch (e) {
      print("Error fetching admin details: $e");
    }
    return null;
  }

  // Sign in with email and password, restricting access to admin only
  Future<UserCredential?> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Verify the email matches the admin email
      if (email != adminEmail) {
        throw Exception("Access Denied: Only admin users are allowed.");
      }

      // Proceed with Firebase authentication if the email is the admin's
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Fetch the current user's userId from Firestore
  Future<String?> getCurrentUserId() async {
    User? user = getCurrentUser();
    if (user != null) {
      // First, check if the user is the admin
      bool isAdminUser = await isAdmin();
      if (isAdminUser) {
        Map<String, dynamic>? adminDetails = await getAdminDetails();
        return adminDetails?['userId'];
      } else {
        try {
          // Fetch the user data from the 'users' collection
          QuerySnapshot querySnapshot = await _firestore
              .collection('users')
              .where('email', isEqualTo: user.email)
              .limit(1)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            return querySnapshot.docs.first['userId'];
          } else {
            print("No user document found for email: ${user.email}");
          }
        } catch (e) {
          print("Error fetching userId by email: $e");
        }
      }
    } else {
      print("No authenticated user.");
    }
    return null;
  }

  // Fetch the order ID for the current user
  Future<String?> getUserOrderId(String userId) async {
    try {
      // Query the 'users' collection for the document with the given userId
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        // Check if the document contains the 'orderId' field
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;
        if (userData != null && userData.containsKey('orderId')) {
          return userData['orderId'];
        } else {
          print("No order ID found for the user.");
          return null;
        }
      } else {
        print("User document does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching order ID: $e");
      return null;
    }
  }

  // Check if the current user is the admin
  Future<bool> isAdmin() async {
    User? user = getCurrentUser();
    return user != null && user.email == adminEmail;
  }

  // Sign up (if needed)
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // Sign the user up
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Log out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut(); // Sign out user from Firebase
      Baker().clearCart(); // Clear cart when signing out
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
