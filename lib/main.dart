import 'package:flutter/material.dart';
import 'screens/music_partner_screen.dart';
import 'screens/join_now_screen.dart';
import 'screens/login.dart';
import 'screens/create_account_screen.dart';
import 'screens/profilestep1.dart';
import 'screens/profilestep2.dart';
import 'screens/profilestep3.dart';

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
         '/more_about_me': (context) => MoreAboutMeScreen(),
         '/profileStep2': (context) => ProfileStep2(),
         '/profileStep3': (context) => ProfileStep3(),



      },
    );
  }
}
