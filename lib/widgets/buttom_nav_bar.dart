import 'package:flutter/material.dart';
import 'package:musicapp1/screens/inboxscreen.dart';
import 'package:musicapp1/screens/matchscreen.dart';
import 'package:musicapp1/screens/musicscreen.dart';
import 'package:musicapp1/screens/explorescreen.dart';
import 'package:musicapp1/screens/profilescreen.dart';


class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget destination;
    switch (index) {
      case 0:
        destination = MatchesScreen(); // Your matches
        break;
      case 1:
        destination = ProfileSuggestionsScreen(); // You'll create this screen
        break;
      case 2:
        destination = NowPlayingScreen(); // Now playing
        break;
      case 3:
        destination = MusicMatchInbox(); // Inbox
        break;
      case 4:
        destination = ProfileScreen(); // Your profile
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor:   const Color.fromARGB(0, 74, 11, 79), // Set your background color here
      selectedItemColor: const Color.fromARGB(255, 117, 17, 170), // Highlight color
      unselectedItemColor: Colors.grey.shade600, // Inactive icon color
      selectedFontSize: 12,
      unselectedFontSize: 11,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      elevation: 8, // Adds shadow
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'My Matches'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Now Playing'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
