import 'package:cheng/components/my_drawer_tile.dart';
import 'package:cheng/pages/calendar_page.dart';
import 'package:cheng/pages/faq_page.dart';
import 'package:cheng/pages/finished.dart';
import 'package:cheng/pages/home_request_change.dart';
import 'package:cheng/pages/login_page.dart';
import 'package:cheng/pages/home_chat_page.dart';
import 'package:cheng/pages/report.dart';
import '../services/auth/auth_service.dart';
import 'package:cheng/pages/cancel_requests_page.dart';
import 'package:cheng/pages/request_change_page.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthService _authService = AuthService();

  int _unreadCount = 0;
  int _unreadRequestChangeCount = 0;
  int _cancelRequestCount = 0;

  void logout() {
    _authService.signOut();
  }

  @override
  void initState() {
    super.initState();
    _fetchUnreadInquiryCount(); // Fetch Inquiry count when widget is created
    _fetchUnreadRequestChangeCount(); // Fetch Request Change count
    _fetchCancelRequestCount(); // Fetch Cancel Request count
  }

  // Efficiently fetch unread Inquiry count similar to Request Change count
  void _fetchUnreadInquiryCount() async {
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((snapshot) async {
      final Set<String> userIdsWithUnreadInquiries = {};

      // Create a list of futures for each user document's unread check
      List<Future<void>> futures = snapshot.docs.map((userDoc) async {
        String userId = userDoc['userId'];
        bool hasUnread = await _hasUnreadInquiryWithAdmin(userId);

        if (hasUnread) {
          userIdsWithUnreadInquiries.add(userId);
        }
      }).toList();

      // Wait for all futures to complete
      await Future.wait(futures);

      setState(() {
        _unreadCount = userIdsWithUnreadInquiries.length;
      });
    });
  }

  // Check if there are unread inquiry messages with the admin for a specific user
  Future<bool> _hasUnreadInquiryWithAdmin(String userId) async {
    String adminId = '01'; // Admin user ID
    List<String> ids = [adminId, userId];
    ids.sort();
    String chatRoomID = ids.join('_');

    QuerySnapshot messageSnapshot = await FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .where('receiverID', isEqualTo: adminId)
        .where('isRead', isEqualTo: false)
        .limit(1)
        .get();

    return messageSnapshot.docs.isNotEmpty;
  }

  // Fetch unread Request Change count by checking orders with unread messages
  void _fetchUnreadRequestChangeCount() {
    FirebaseFirestore.instance
        .collection('orders')
        .snapshots()
        .listen((snapshot) async {
      if (!mounted) return; // Check if the widget is still mounted

      final Set<String> userIdsWithUnreadRequestChange = {};

      List<Future<void>> futures = snapshot.docs.map((orderDoc) async {
        String userId = orderDoc['userId'];
        bool hasUnread =
            await _hasUnreadRequestChangeWithAdmin(userId, orderDoc.id);

        if (hasUnread) {
          userIdsWithUnreadRequestChange.add(userId);
        }
      }).toList();

      await Future.wait(futures);

      if (mounted) {
        setState(() {
          _unreadRequestChangeCount = userIdsWithUnreadRequestChange.length;
        });
      }
    });
  }

  // Check if there are unread request change messages for an order
  Future<bool> _hasUnreadRequestChangeWithAdmin(
      String userId, String orderId) async {
    String adminId = '01';
    List<String> ids = [adminId, userId];
    ids.sort();
    String chatRoomID = ids.join('_');

    QuerySnapshot messageSnapshot = await FirebaseFirestore.instance
        .collection('request_rooms')
        .doc(chatRoomID)
        .collection(orderId)
        .where('receiverID', isEqualTo: adminId)
        .where('isRead', isEqualTo: false)
        .limit(1)
        .get();

    return messageSnapshot.docs.isNotEmpty;
  }

  // Fetch cancel request count for orders with status "waiting for cancellation approval"
  void _fetchCancelRequestCount() {
    FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'waiting for cancellation approval')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        _cancelRequestCount = snapshot.docs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Drawer(
        backgroundColor: Colors.lightBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/login.gif',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text.rich(
                      TextSpan(
                        text: 'Hi, ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'ADMIN',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              MyDrawerTile(
                text: "O R D E R S",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              MyDrawerTile(
                text: "C A L E N D A R",
                icon: Icons.calendar_month,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarPage()),
                  );
                },
              ),
              MyDrawerTile(
                text: "I N Q U I R Y",
                icon: Icons.chat,
                trailing: _unreadCount > 0
                    ? CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '$_unreadCount',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      )
                    : const SizedBox.shrink(),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeChatPage()),
                  );
                },
              ),
              MyDrawerTile(
                text: "R E Q U E S T S C H A N G E",
                icon: Icons.change_circle,
                trailing: _unreadRequestChangeCount > 0
                    ? CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '$_unreadRequestChangeCount',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      )
                    : const SizedBox.shrink(),
                onTap: () async {
                  String? currentUserId = await _authService.getCurrentUserId();
                  bool isAdmin = await _authService.isAdmin();

                  if (isAdmin) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeRequestChatPage(),
                      ),
                    );
                  } else {
                    Map<String, dynamic>? adminDetails =
                        await _authService.getAdminDetails();
                    if (adminDetails == null) {
                      print("Admin details not found");
                      return;
                    }

                    String adminUserId = adminDetails['userId'];
                    String adminEmail = adminDetails['email'];
                    String orderId = 'someOrderId';

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestChangePage(
                          receiverEmail: adminEmail,
                          receiverID: adminUserId,
                          orderId: orderId,
                        ),
                      ),
                    );
                  }
                },
              ),
              MyDrawerTile(
                text: "C A N C E L R E Q U E S T S",
                icon: Icons.cancel,
                trailing: _cancelRequestCount > 0
                    ? CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '$_cancelRequestCount',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      )
                    : const SizedBox.shrink(),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CancelRequestsPage()));
                },
              ),
              MyDrawerTile(
                text: "C O M P L E T E  O R D E R S",
                icon: Icons.cancel,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Finished()));
                },
              ),
              MyDrawerTile(
                text: "R E P O R T",
                icon: Icons.newspaper,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Report()));
                },
              ),
              MyDrawerTile(
                text: " F A Q",
                icon: Icons.chat,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FaqPage()),
                  );
                },
              ),
              const SizedBox(height: 90),
              MyDrawerTile(
                text: "L O G  O U T",
                icon: Icons.logout,
                onTap: () {
                  Navigator.pop(context);
                  logout();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage(onTap: null)));
                },
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchUnreadRequestChangeCount(); // Refresh the Request Change count whenever dependencies change
  }
}
