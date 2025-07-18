import 'package:cheng/pages/home_page.dart';
import 'package:cheng/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //admin login
        if (snapshot.hasData) {
          return const HomePage();
        }
        //if not logged in
        else {
          return const LoginOrRegister();
        }
      },
    ));
  }
}
