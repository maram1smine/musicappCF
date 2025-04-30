import 'package:flutter/material.dart';
import 'screens/music_partner_screen.dart';
import 'screens/join_now_screen.dart';
import 'screens/login.dart';
import 'screens/create_account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove banner from the top
      initialRoute: '/',
      routes: {
        '/': (context) => MusicPartnerScreen(),
        '/join_now': (context) => JoinNowScreen(),
        '/login': (context) => LoginScreen(),
        '/create_profile': (context) => CreateAccountScreen(),
      },
    );
  }
}
