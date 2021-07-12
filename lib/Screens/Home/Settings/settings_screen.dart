import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/Screens/Home/Settings/Components/body.dart';
import 'package:grocery_application/Shared/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        centerTitle: true,
        title: Text("Settings",
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
