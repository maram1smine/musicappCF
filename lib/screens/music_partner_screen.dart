import 'package:flutter/material.dart';
import 'join_now_screen.dart'; // Import the Join Now screen
import 'login.dart';


class MusicPartnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/mobapp.png"), // Use assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 50),
                child: Text(
                  "FIND YOUR \n MUSIC PARTNER",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 230),
                child: Text(
                  "Immerse yourself into the \n world of music today",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ),
              Spacer(flex: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JoinNowScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.purpleAccent,
                ),
                child: Text(
                  "Join Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Spacer(flex: 1),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()), // ✅ Navigate to LoginScreen
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}