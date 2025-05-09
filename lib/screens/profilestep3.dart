import 'package:flutter/material.dart';

class ProfileStep3 extends StatelessWidget {
  final List<String> prompts = [
    "A song I vibe to when I’m sad...",
    "My ultimate hype track is...",
    "If I could duet with any artist..."
  ];

  ProfileStep3({super.key});

  @override
  Widget build(BuildContext context) {
    // Create prompt cards
    List<Widget> children =
        prompts.map((prompt) => PromptCard(prompt)).toList();

    // Add Spacer and Finish button
    children.add(Spacer());
    children.add(
      ElevatedButton(
        onPressed: () {
          // TODO: Save and finish profile setup
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile setup complete!')),
          );
          // You can also navigate to home or another screen here
        },
        child: Text("Finish"),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Create Profile (3/3)")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class PromptCard extends StatelessWidget {
  final String prompt;
  final TextEditingController controller = TextEditingController();

  PromptCard(this.prompt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(prompt, style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Your answer"),
            ),
          ],
        ),
      ),
    );
  }
}
