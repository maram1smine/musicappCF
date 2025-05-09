import 'package:flutter/material.dart';
import '../widgets/custom_input_fields.dart';
import '../widgets/rounded_button.dart';
import 'create_account_screen.dart';
import 'inboxscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double _deviceHeight;
  late double _deviceWidth;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.02),
        height: _deviceHeight,
        width: _deviceWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/1.png"), // Change this path to your image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageTitle(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _loginForm(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _loginButton(),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            _registerAccountLink(),
          ],
        ),
      ),
    );
  }

  Widget pageTitle() {
    return SizedBox(
      height: _deviceHeight * 0.10,
      child: Text(
        'WELCOME BACK',
        style: TextStyle(
          color: const Color.fromARGB(255, 242, 239, 244),
          fontSize: 40,
          fontWeight: FontWeight.w600, // Corrected syntax
        ),
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
        height: _deviceHeight * 0.18,
        child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFormFields(
                    onSaved: (value) {},
                    regEx:
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    hintText: "email",
                    obscureText: false),
                CustomTextFormFields(
                    onSaved: (value) {},
                    regEx: r",{8,}",
                    hintText: "Password",
                    obscureText: true),
              ],
            )));
  }

  Widget _loginButton() {
    return RoundedButton(
        name: "Login",
        height: _deviceHeight * 0.065,
        width: _deviceWidth * 0.65,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicMatchInbox(),
            ),
          );
        });
  }

  Widget _registerAccountLink() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateAccountScreen()),
        );
      },
      child: Text(
        'Don\'t have an account?',
        style: TextStyle(
          color: const Color.fromARGB(255, 232, 234, 238),
        ),
      ),
    );
  }
}
