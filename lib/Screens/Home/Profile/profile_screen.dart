import 'package:flutter/material.dart';
import 'package:grocery_application/Screens/Home/Profile/Components/body.dart';
import 'package:grocery_application/Shared/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        centerTitle: true,
        title: Text("Profile",
            style: TextStyle(color: black), textDirection: TextDirection.ltr),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.red,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        leading: BackButton(
          color: black,
        ),
      ),
      body: Body(),
    );
  }
}
