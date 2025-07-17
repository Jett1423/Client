import 'package:cheng/components/my_buttons.dart';
import 'package:cheng/components/my_textfield.dart';
import 'package:cheng/pages/home_page.dart';
import 'package:cheng/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible =
      false; // Add this boolean to track password visibility

  // login method
  void login() async {
    final authService = AuthService();

    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          content: Text("Email and Password cannot be empty."),
        ),
      );
      return;
    }

    if (emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          content: Text("Email cannot be empty."),
        ),
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          content: Text("Input your password."),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      bool isAdminUser = await authService.isAdmin();
      if (isAdminUser) {
        Navigator.pop(context);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        Navigator.pop(context);

        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Access Denied"),
            content: Text("You do not have admin privileges."),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);

      String errorMessage = e.toString();

      if (errorMessage.contains('user-not-found')) {
        errorMessage = "Email not found. Please check your email.";
      } else if (errorMessage.contains('wrong-password')) {
        errorMessage = "Incorrect password. Please try again.";
      } else if (errorMessage.contains('Access Denied')) {
        errorMessage = "Access Denied";
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Error"),
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 244, 244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Image.asset(
                  'assets/images/login.gif',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Admin",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const SizedBox(height: 30),

              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 20),

              // Password TextField with toggle icon
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText:
                    !_isPasswordVisible, // Toggle obscureText based on visibility
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle visibility
                    });
                  },
                ),
              ),
              const SizedBox(height: 40),

              MyButtons(
                text: "Sign In",
                onTap: login,
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
