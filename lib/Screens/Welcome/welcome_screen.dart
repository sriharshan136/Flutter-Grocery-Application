import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:grocery_application/Screens/wrapper.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Carousel(
        showIndicator: false,
        animationDuration: Duration(milliseconds: 600),
        images: [
          AssetImage('assets/images/bgImage_1.png'),
          AssetImage('assets/images/bgImage_2.png'),
          AssetImage('assets/images/bgImage_3.png'),
          AssetImage('assets/images/bgImage_4.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              PageTransition(type: PageTransitionType.fade, child: Wrapper()));
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.arrow_forward_sharp,
          color: white,
        ),
      ),
    );
  }
}
