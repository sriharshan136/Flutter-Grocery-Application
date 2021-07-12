import 'package:flutter/material.dart';
import 'package:grocery_application/Models/user.dart';
import 'package:grocery_application/Screens/Authenticate/authenticate.dart';
import 'package:grocery_application/Screens/Home/my_navigation_bar.dart';
import 'package:grocery_application/Shared/constants.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      userId = user.uid;
      return MyNavigationBar();
    }
  }
}
