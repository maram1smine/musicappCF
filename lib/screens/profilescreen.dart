import 'package:flutter/material.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';
import 'modifyscreen.dart';
import 'login.dart'; // Added import for LoginScreen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = {
      'name': 'Alex Harmony',
      'username': '@alexharmony',
      'country': '🇫🇷 France',
      'bio': 'Music is life 🎧 | Indie lover | Always vibin’',
      'favoriteGenre': 'Indie Rock',
      'favoriteArtist': 'Tame Impala',
      'profilePic': 'assets/avatars/alex.jpg',
    };

    return Scaffold(
      backgroundColor: const Color(0xFF1D0036), // Fond violet foncé
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparente
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white), // Texte blanc
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white), // Icône blanche
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ModifyProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(userData['profilePic']!),
          ),
          const SizedBox(height: 12),
          Text(
            userData['name']!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texte blanc
            ),
          ),
          Text(
            userData['username']!,
            style: const TextStyle(color: Colors.white70), // Texte secondaire
          ),
          const SizedBox(height: 10),
          Text(
            userData['country']!,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Text(
              userData['bio']!,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white70, // Texte bio en blanc cassé
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(color: Colors.white24), // Divider en blanc très clair
          ListTile(
            leading: const Icon(Icons.music_note, color: Colors.white),
            title: const Text(
              'Favorite Genre',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              userData['favoriteGenre']!,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.white),
            title: const Text(
              'Favorite Artist',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              userData['favoriteArtist']!,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: const Color(0xFF3A1A5A), // Fond de dialogue assorti
                    title: const Text(
                      "Log out",
                      style: TextStyle(color: Colors.white),
                    ),
                    content: const Text(
                      "Are you sure you want to log out?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                            (route) => false, // Remove all previous routes
                          );
                        },
                        child: const Text(
                          "Log Out",
                          style: TextStyle(
                            color: Color.fromARGB(255, 117, 17, 170),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text('Log Out', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 117, 17, 170), // Violet vif
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordure arrondie
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }
}


