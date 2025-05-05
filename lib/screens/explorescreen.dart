// profile_suggestions_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:musicapp1/widgets/buttom_nav_bar.dart';

class ProfileSuggestionsScreen extends StatefulWidget {
  @override
  _ProfileSuggestionsScreenState createState() =>
      _ProfileSuggestionsScreenState();
}

class _ProfileSuggestionsScreenState extends State<ProfileSuggestionsScreen> {
  final List<Map<String, String>> suggestions = [
    {
      'name': 'Eliza Doe',
      'age': '25',
      'location': 'New York',
      'distance': '10 KMS AWAY',
      'avatar': 'images/profil2.png',

    },
    {
      'name': 'Noah Vibes',
      'age': '27',
      'location': 'Los Angeles',
      'distance': '15 KMS AWAY',
      'avatar': 'images/profil1.png',

    },
  ];

  int currentIndex = 0;
  bool isLiked = false;
  bool isDisliked = false;

  void triggerFeedback(bool liked) {
    setState(() {
      if (liked) {
        isLiked = true;
      } else {
        isDisliked = true;
      }
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isLiked = false;
        isDisliked = false;
      });
    });
  }

  List<Widget> buildCards() {
    return suggestions.map((suggestion) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(suggestion['avatar']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${suggestion['name']}, ${suggestion['age']}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "${suggestion['location']} - ${suggestion['distance']}",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Active Now',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cards = buildCards();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A002D), // Violet foncé
        title: Text('Find your partner',style: TextStyle(color: Colors.white),),
        leading: BackButton(color: Colors.white),
      ),

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: CardSwiper(
                  cards: cards,
                  numberOfCardsDisplayed: 1,
                  isLoop: true,
                  onSwipe: (index, direction) {
                    setState(() {
                      currentIndex = index;
                    });

                    if (direction == CardSwiperDirection.right) {
                      print("Liked ${suggestions[index]['name']}");
                      triggerFeedback(true);
                    } else if (direction == CardSwiperDirection.left) {
                      print("Disliked ${suggestions[index]['name']}");
                      triggerFeedback(false);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDisliked ? Colors.redAccent : Colors.red,
                        boxShadow: isDisliked
                            ? [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.6),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                )
                              ]
                            : [],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.thumb_down, color: Colors.white),
                        onPressed: () {
                          triggerFeedback(false);
                        },
                      ),
                    ),
                    SizedBox(width: 32),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isLiked ? Colors.greenAccent : Colors.green,
                        boxShadow: isLiked
                            ? [
                                BoxShadow(
                                  color: Colors.greenAccent.withOpacity(0.6),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                )
                              ]
                            : [],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.thumb_up, color: Colors.white),
                        onPressed: () {
                          triggerFeedback(true);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
