import 'package:flutter/material.dart';

class ProfileStep2 extends StatelessWidget {
  const ProfileStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Profile (2/3)")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Add some photos of you jamming out"),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) => Card(child: Icon(Icons.image)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profileStep3');
              },
              child: Text("Continue"),
            )
          ],
        ),
      ),
    );
  }
}
