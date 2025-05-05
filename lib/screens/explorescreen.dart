// profile_suggestions_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';

class ProfileSuggestionsScreen extends StatefulWidget {
  @override
  _ProfileSuggestionsScreenState createState() => _ProfileSuggestionsScreenState();
}

class _ProfileSuggestionsScreenState extends State<ProfileSuggestionsScreen> {
  final List<Map<String, String>> suggestions = [
    {
      'name': 'Eliza Doe',
      'age': '25',
      'location': 'New York',
      'distance': '10 KMS AWAY',
      'avatar': 'images/profil2.png',
      'background': 'images/1.png',
    },
    {
      'name': 'Noah Vibes',
      'age': '27',
      'location': 'Los Angeles',
      'distance': '15 KMS AWAY',
      'avatar': 'images/profil1.png',
      'background': 'images/1.png',
    },
  ];

  int currentIndex = 0;

  void _onLike() {
    print("Liked ${suggestions[currentIndex]['name']}");
    _swipeNext();
  }

  void _onDislike() {
    print("Disliked ${suggestions[currentIndex]['name']}");
    _swipeNext();
  }

  void _swipeNext() {
    setState(() {
      if (currentIndex < suggestions.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // Loop back to start
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find your partner"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple, Colors.black],
              ),
            ),
          ),
          Swiper(
            itemCount: suggestions.length,
            index: currentIndex,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return Card(
                elevation: 8,
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        suggestion['avatar']!,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${suggestion['name']}, ${suggestion['age']}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white70, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '${suggestion['location']} - ${suggestion['distance']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Active Now',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            loop: true,
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: _onDislike,
                  child: Icon(Icons.thumb_down, color: Colors.white),
                ),
                SizedBox(width: 32),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: _onLike,
                  child: Icon(Icons.thumb_up, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}