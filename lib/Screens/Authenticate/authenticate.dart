import 'package:flutter/material.dart';
import 'package:grocery_application/Screens/Authenticate/Login/login_screen.dart';
import 'package:grocery_application/Screens/Authenticate/Register/register_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(
        toggleView: toggleView,
      );
    } else {
      return RegisterScreen(
        toggleView: toggleView,
      );
    }
  }
}
