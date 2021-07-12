import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/Screens/Home/Cart/cart_page.dart';
import 'package:grocery_application/Screens/Home/Favourite/favourite_page.dart';
import 'package:grocery_application/Screens/Home/Home/home_screen.dart';
import 'package:grocery_application/Screens/Home/Profile/profile_screen.dart';
import 'package:grocery_application/Screens/Home/Settings/settings_screen.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/constants.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  List<Widget> _children = [
    ProfileScreen(),
    FavouritePage(),
    HomeScreen(),
    CartPage(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _children[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        color: Colors.white,
        backgroundColor: bgColor,
        buttonBackgroundColor: Colors.orangeAccent,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.store_sharp,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.black,
          ),
        ],
        animationDuration: Duration(milliseconds: 200),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
