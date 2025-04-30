import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart'; // Import reusable widget
import 'create_account_screen.dart';

class JoinNowScreen extends StatefulWidget {
  @override
  _JoinNowScreenState createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends State<JoinNowScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "images/2.jpg",
      "title": "Music That Feels You",
      "description":
          "Let the melodies weave through your soul.Feel every note echoing your emotions.From laughter to tears, find the sound that dances with you."
    },
    {
      "image": "images/3.jpg",
      "title": "Seamless Connections",
      "description":
          "Message, share, and vibe together.Connect through the music you love."
    },
    {
      "image": "images/4.jpg",
      "title": "Bond over beats that resonate",
      "description":
          "Discover souls who sway to the same rhythm. Forge bonds through shared songs, where hearts beat as one."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) => OnboardingPage(
              image: onboardingData[index]["image"]!,
              title: onboardingData[index]["title"]!,
              description: onboardingData[index]["description"]!,
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.purpleAccent
                        : Colors.white54,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                if (_currentPage < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  // Navigate to LoginScreen when it's the last page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountScreen()),
                  );
                }
              },
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateAccountScreen()), // Navigate to Login Page
                );
              },
              child: Text("Skip",
                  style: TextStyle(color: Colors.white70, fontSize: 18)),
            ),
          ),
          // New button at the top left to go to Join Now Page
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                if (_currentPage == 0) {
                  // If the user is on the first screen, go back to music_partner_screen
                  Navigator.pop(context);
                } else {
                  // Otherwise, go back to the previous onboarding screen
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
