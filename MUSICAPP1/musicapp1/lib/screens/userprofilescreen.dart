import 'package:flutter/material.dart';

// User profile screen
class UserProfileScreen extends StatelessWidget {
  final String name;
  final String avatar;

  UserProfileScreen({required this.name, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(radius: 50, backgroundImage: AssetImage(avatar)),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(height: 40),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Liked Songs"),
            onTap: () {
              // Navigate or show modal
            },
          ),
          ListTile(
            leading: Icon(Icons.queue_music),
            title: Text("Playlist"),
            onTap: () {
              // Navigate or show modal
            },
          ),
        ],
      ),
    );
  }
}
