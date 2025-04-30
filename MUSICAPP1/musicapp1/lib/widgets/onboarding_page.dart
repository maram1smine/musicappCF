import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingPage(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 100),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(image, height: 300, width: 300, fit: BoxFit.cover),
        ),
        SizedBox(height: 0),
        Text(title,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(description,
              style: TextStyle(fontSize: 18, color: Colors.white70),
              textAlign: TextAlign.center),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}