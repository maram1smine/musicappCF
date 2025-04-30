// profile_suggestions_screen.dart
import 'package:flutter/material.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';

class ProfileSuggestionsScreen extends StatelessWidget {
  final List<Map<String, String>> suggestions = [
    {'name': 'Eliza Doe', 'avatar': 'assets/avatars/eliza.jpg'},
    {'name': 'Noah Vibes', 'avatar': 'assets/avatars/noah.jpg'},
    // Add more suggestions
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suggested Profiles")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(suggestion['avatar']!),
              ),
              title: Text(suggestion['name']!),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Optional: Navigate to full profile
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
