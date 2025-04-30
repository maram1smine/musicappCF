import 'package:flutter/material.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';

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
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to modify profile screen
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            userData['username']!,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 10),
          Text(userData['country']!, style: TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Text(
              userData['bio']!,
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Favorite Genre'),
            trailing: Text(userData['favoriteGenre']!),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Favorite Artist'),
            trailing: Text(userData['favoriteArtist']!),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                // Log out logic here
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Log out"),
                    content: Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigate to login screen or perform logout
                        },
                        child: Text("Log Out"),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.logout),
              label: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 117, 17, 170),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }
}

class ModifyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example Modify screen
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Center(
        child: Text(
          "Profile Editing Form Goes Here",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

