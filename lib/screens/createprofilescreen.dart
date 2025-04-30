// import 'package:flutter/material.dart';
// import 'login.dart'; // For navigation to LoginScreen

// class CreateProfileScreen extends StatefulWidget {
//   @override
//   _CreateProfileScreenState createState() => _CreateProfileScreenState();
// }

// class _CreateProfileScreenState extends State<CreateProfileScreen> {
//   int _currentStep = 1; // Track the current step (1, 2, or 3)
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final List<String> photos = []; // Placeholder for photo URLs (simulated)
//   final List<Map<String, String>> profileAnswers = []; // Store prompt answers
//   final _formKey = GlobalKey<FormState>();

//   // Simulate adding a photo (replace with actual image picker logic)
//   void _addPhoto() {
//     setState(() {
//       if (photos.length < 4) {
//         photos.add('placeholder'); // Simulate adding a photo
//       }
//     });
//   }

//   // Simulate adding a profile answer (replace with actual prompt selection)
//   void _addProfileAnswer() {
//     setState(() {
//       profileAnswers.add({'prompt': 'Sample prompt', 'answer': 'Sample answer'});
//     });
//   }

//   // Navigate to the next step or complete the process
//   void _nextStep() {
//     if (_currentStep == 1) {
//       if (_formKey.currentState!.validate()) {
//         setState(() {
//           _currentStep = 2;
//         });
//       }
//     } else if (_currentStep == 2) {
//       setState(() {
//         _currentStep = 3;
//       });
//     } else if (_currentStep == 3) {
//       if (profileAnswers.isNotEmpty) {
//         // Navigate to LoginScreen after completing all steps
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//           (route) => false,
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please add at least one profile answer')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1D0036), // Match the app theme
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             if (_currentStep > 1) {
//               setState(() {
//                 _currentStep--;
//               });
//             } else {
//               Navigator.pop(context);
//             }
//           },
//         ),
//         title: const Text(
//           'Create Profile',
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               '$_currentStep/3',
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               _buildStepContent(),
//               const SizedBox(height: 40),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _nextStep,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 117, 17, 170), // Purple button
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Text(
//                     _currentStep == 3 ? 'Finish' : 'Continue',
//                     style: const TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginScreen()),
//                     );
//                   },
//                   child: const Text(
//                     "Already have an account? Log in",
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStepContent() {
//     switch (_currentStep) {
//       case 1:
//         return _buildStep1();
//       case 2:
//         return _buildStep2();
//       case 3:
//         return _buildStep3();
//       default:
//         return Container();
//     }
//   }

//   // Step 1: About You (Name and Email)
//   Widget _buildStep1() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'About you',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Begin your Wandrr journey. Let's get to know you!",
//             style: TextStyle(color: Colors.white70),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: nameController,
//             style: const TextStyle(color: Colors.white),
//             decoration: const InputDecoration(
//               labelText: 'Name',
//               hintText: 'What shall we call you? Last name is optional',
//               labelStyle: TextStyle(color: Colors.white70),
//               hintStyle: TextStyle(color: Colors.white54),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white70),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color.fromARGB(255, 117, 17, 170)),
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: emailController,
//             style: const TextStyle(color: Colors.white),
//             decoration: const InputDecoration(
//               labelText: 'Email',
//               hintText: 'No spam. Promise.',
//               labelStyle: TextStyle(color: Colors.white70),
//               hintStyle: TextStyle(color: Colors.white54),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white70),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color.fromARGB(255, 117, 17, 170)),
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                   .hasMatch(value)) {
//                 return 'Please enter a valid email';
//               }
//               return null;
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // Step 2: Pictures
//   Widget _buildStep2() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Pictures',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'Share a glimpse of your wanderlust with photos from your trips',
//           style: TextStyle(color: Colors.white70),
//         ),
//         const SizedBox(height: 20),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 1,
//           ),
//           itemCount: photos.length + 1, // +1 for the "add photo" tile
//           itemBuilder: (context, index) {
//             if (index == photos.length) {
//               return GestureDetector(
//                 onTap: _addPhoto,
//                 child: Container(
//                   color: Colors.grey.withOpacity(0.2),
//                   child: const Icon(
//                     Icons.add,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               );
//             }
//             return Container(
//               color: Colors.grey.withOpacity(0.2),
//               child: const Icon(
//                 Icons.image,
//                 color: Colors.white,
//                 size: 40,
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'Tap to edit, drag to reorder',
//           style: TextStyle(color: Colors.white54, fontSize: 12),
//         ),
//       ],
//     );
//   }

//   // Step 3: Profile Answers
//   Widget _buildStep3() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Profile Answers',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'Choose a prompt that resonates with your travel journey and craft a unique answer',
//           style: TextStyle(color: Colors.white70),
//         ),
//         const SizedBox(height: 20),
//         ...profileAnswers.map((answer) => Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white70),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   '${answer['prompt']}: ${answer['answer']}',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             )),
//         GestureDetector(
//           onTap: _addProfileAnswer,
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white70),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Tap to select a prompt and answer it',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//                 Icon(Icons.add, color: Colors.white70),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'At least 1 required',
//           style: TextStyle(color: Colors.white54, fontSize: 12),
//         ),
//       ],
//     );
//   }
// }