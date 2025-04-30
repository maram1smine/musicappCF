import 'package:flutter/material.dart';

class MoreAboutMeScreen extends StatefulWidget {
  @override
  _MoreAboutMeScreenState createState() => _MoreAboutMeScreenState();
}

class _MoreAboutMeScreenState extends State<MoreAboutMeScreen> {
  List<String> selectedGenres = [];
  List<String> genres = [
    'Pop', 'Rock', 'Hip Hop', 'Jazz', 'Classical', 'EDM',
    'R&B', 'Country', 'Indie', 'K-pop', 'Afrobeat', 'Reggaeton'
  ];

  List<String> favoriteArtists = [];
  final TextEditingController artistController = TextEditingController();

  String? selectedMood;
  List<String> moods = [
    'Sad songs', 'Party vibes', 'Chill & Lo-fi', 'Motivational', 'Romantic', 'Oldies'
  ];

  void addArtist(String artist) {
    if (artist.isNotEmpty && !favoriteArtists.contains(artist)) {
      setState(() {
        favoriteArtists.add(artist);
        artistController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A1B9A), // Purple background
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Create Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  '1/3',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What music genres do you love?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                children: genres.map((genre) {
                  final isSelected = selectedGenres.contains(genre);
                  return FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        isSelected ? selectedGenres.remove(genre) : selectedGenres.add(genre);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              Text("Your all-time favorite artists?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: artistController,
                onSubmitted: addArtist,
                decoration: InputDecoration(
                  hintText: "Type an artist and press Enter",
                ),
              ),
              Wrap(
                spacing: 8,
                children: favoriteArtists.map((artist) {
                  return Chip(
                    label: Text(artist),
                    onDeleted: () {
                      setState(() {
                        favoriteArtists.remove(artist);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              Text("What's your go-to music mood?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                children: moods.map((mood) {
                  return ChoiceChip(
                    label: Text(mood),
                    selected: selectedMood == mood,
                    onSelected: (_) {
                      setState(() {
                        selectedMood = mood;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Replace with your next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Placeholder(), // Replace with ProfileStep2()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A1B9A),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


