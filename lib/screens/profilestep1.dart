import 'package:flutter/material.dart';

class MoreAboutMeScreen extends StatefulWidget {
  const MoreAboutMeScreen({super.key});

  @override
  State<MoreAboutMeScreen> createState() => _MoreAboutMeScreenState();
}

class _MoreAboutMeScreenState extends State<MoreAboutMeScreen> {
  List<String> selectedGenres = [];
  List<String> genres = [
    'Pop',
    'Rock',
    'Hip Hop',
    'Jazz',
    'Classical',
    'EDM',
    'R&B',
    'Country',
    'Indie',
    'K-pop',
    'Afrobeat',
    'Reggaeton'
  ];

  List<String> favoriteArtists = [];
  final TextEditingController artistController = TextEditingController();

  String? selectedMood;
  List<String> moods = [
    'Sad songs',
    'Party vibes',
    'Chill & Lo-fi',
    'Motivational',
    'Romantic',
    'Oldies'
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
      backgroundColor: Color(0xFF6A1B9A),
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header avec Create Profile et cercle 1/3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Color(0xFF6A1B9A),
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    Icon(Icons.arrow_back, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Create Profile",
                              style: TextStyle(
                                color: Color(0xFF6A1B9A),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF6A1B9A).withValues(alpha: 0.1),
                          ),
                          child: Text(
                            '1/3',
                            style: TextStyle(
                              color: Color(0xFF6A1B9A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),

                    Text("What music genres do you love?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: genres.map((genre) {
                        final isSelected = selectedGenres.contains(genre);
                        return FilterChip(
                          label: Text(genre),
                          selected: isSelected,
                          selectedColor:
                              Color(0xFF6A1B9A).withValues(alpha: 0.2),
                          checkmarkColor: Color(0xFF6A1B9A),
                          onSelected: (selected) {
                            setState(() {
                              isSelected
                                  ? selectedGenres.remove(genre)
                                  : selectedGenres.add(genre);
                            });
                          },
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 32),
                    Divider(),

                    SizedBox(height: 16),
                    Text("Your all-time favorite artists?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    TextField(
                      controller: artistController,
                      onSubmitted: addArtist,
                      decoration: InputDecoration(
                        hintText: "Type an artist and press Enter",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    SizedBox(height: 8),
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

                    SizedBox(height: 32),
                    Divider(),

                    SizedBox(height: 16),
                    Text("What's your go-to music mood?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: moods.map((mood) {
                        return ChoiceChip(
                          label: Text(mood),
                          selected: selectedMood == mood,
                          selectedColor:
                              Color(0xFF6A1B9A).withValues(alpha: 0.2),
                          onSelected: (_) {
                            setState(() {
                              selectedMood = mood;
                            });
                          },
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Placeholder(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6A1B9A),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 4,
                        ),
                        child: Text('Continue', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
