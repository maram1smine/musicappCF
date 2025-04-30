import 'package:flutter/material.dart';

class ModifyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D0036), // Fond assorti
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          "Profile Editing Form Goes Here",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}