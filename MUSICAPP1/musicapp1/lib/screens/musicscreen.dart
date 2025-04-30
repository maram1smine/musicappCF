// now_playing_screen.dart
import 'package:flutter/material.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D0036),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Playlists', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF3A1A5A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search song, playlist, artist...',
                  hintStyle: TextStyle(color: Colors.white54),
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tabs
            Row(
              children: const [
                Text('Recent', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Text('Festival', style: TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 20),
            // Playlist thumbnails
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('images/r&b.jpg'),
                      ),
                      const SizedBox(height: 6),
                      const Text('R&B Playlist', style: TextStyle(color: Colors.white)),
                      const Text('Chill your mind', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('images/dailymix.jpg'),
                      ),
                      const SizedBox(height: 6),
                      const Text('Daily Mix 2', style: TextStyle(color: Colors.white)),
                      const Text('Made for you', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text('Your favourites', style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 10),
            // Songs List
            const SongItem(title: 'Bye Bye', artist: 'Marshmello, Juice WRLD', duration: '2:09'),
            SongItem(title: 'I Like You', artist: 'Post Malone, Doja Cat', duration: '4:03'),
            SongItem(title: 'Fountains', artist: 'Drake, Tems', duration: '3:18'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}

class SongItem extends StatelessWidget {
  final String title, artist, duration;

  const SongItem({
    super.key,
    required this.title,
    required this.artist,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.music_note, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(artist, style: const TextStyle(color: Colors.white70)),
      trailing: Text(duration, style: const TextStyle(color: Colors.white54)),
    );
  }
}
