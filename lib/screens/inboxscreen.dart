import 'package:flutter/material.dart';
import 'chatscreen.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart'; // Custom BottomNavBar

class MusicMatchInbox extends StatefulWidget {
  @override
  _MusicMatchInboxState createState() => _MusicMatchInboxState();
}

class _MusicMatchInboxState extends State<MusicMatchInbox> {
  final List<Map<String, dynamic>> messages = [
    {
      'name': 'Darlene Steward',
      'country': '🇮🇳',
      'message': 'Sent a song rec: Arctic Monkeys',
      'time': '18:31',
      'unread': 5,
      'avatar': 'assets/avatars/darlene.jpg',
    },
    {
      'name': 'Jiggle Williamson',
      'country': '🇺🇸',
      'message': 'Loved your playlist!',
      'time': '6:12',
      'unread': 0,
      'avatar': 'assets/avatars/jiggle.jpg',
    },
    {
      'name': 'Ronald McMuffin',
      'country': '🇨🇦',
      'message': 'Let’s jam tonight?',
      'time': 'Yesterday',
      'unread': 0,
      'avatar': 'assets/avatars/ronald.jpg',
    },
    {
      'name': 'Albert LePew',
      'country': '🇧🇪',
      'message': 'New beats dropping 🔥',
      'time': 'Yesterday',
      'unread': 0,
      'avatar': 'assets/avatars/albert.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D0036),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(Icons.search, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          return ListTile(
            tileColor: msg['unread'] > 0 ? Colors.deepPurple.shade900.withOpacity(0.3) : null,
            leading: CircleAvatar(
              backgroundImage: AssetImage(msg['avatar']),
              radius: 24,
            ),
            title: Row(
              children: [
                Text(
                  msg['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const SizedBox(width: 6),
                Text(msg['country'], style: const TextStyle(fontSize: 12)),
              ],
            ),
            subtitle: Text(
              msg['message'],
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(msg['time'], style: const TextStyle(fontSize: 12, color: Colors.white70)),
                if (msg['unread'] > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 117, 17, 170),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg['unread'].toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    matchedUserName: msg['name'],
                    matchedUserImage: msg['avatar'],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}

