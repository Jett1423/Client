import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final Widget? trailing; // Add trailing parameter

  const MyDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.trailing, // Initialize trailing as optional
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white)),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      trailing: trailing, // Set trailing widget here
      onTap: onTap,
    );
  }
}
