import 'package:flutter/material.dart';
import 'userprofilescreen.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';

// Matches screen
class MatchesScreen extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {'name': 'Camila Vega', 'avatar': 'assets/avatars/camila.jpg'},
    {'name': 'Leo Martins', 'avatar': 'assets/avatars/leo.jpg'},
    // Add more...
  ];

  MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D0036),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Your Matches', style: TextStyle(color: Colors.white))),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UserProfileScreen(
                  name: match['name']!,
                  avatar: match['avatar']!,
                ),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(match['avatar']!),
                ),
                SizedBox(height: 8),
                Text(match['name']!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
