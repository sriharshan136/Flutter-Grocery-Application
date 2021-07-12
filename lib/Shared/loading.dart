import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery_application/Shared/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 20,
          ),
          SpinKitFadingCircle(
            color: red,
            size: 50.0,
          ),
        ]),
      ),
    );
  }
}
