import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String matchedUserName;
  final String matchedUserImage;
 


//////////
  ChatScreen({required this.matchedUserName, required this.matchedUserImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(matchedUserImage),
            ),
            SizedBox(width: 10),
            Text(
              matchedUserName,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red[50],
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Enable push notifications to see when ${matchedUserName} replies.',
                    style: TextStyle(color: const Color.fromARGB(255, 117, 17, 170)),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Enable'),
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You matched with $matchedUserName', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  Text('14 hours ago', style: TextStyle(color: const Color.fromARGB(255, 117, 17, 170))),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(matchedUserImage),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text('🎵 View Their Playlist'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:const Color.fromARGB(255, 117, 17, 170),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Get Listening Stats',
  style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Row(
              children: [
                Icon(Icons.music_note, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: const Color.fromARGB(255, 117, 17, 170)),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
