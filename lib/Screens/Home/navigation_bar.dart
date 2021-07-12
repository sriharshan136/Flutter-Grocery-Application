import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Screens/Home/Address/address_screen.dart';
import 'package:grocery_application/Screens/Home/Cart/cart_page.dart';
import 'package:grocery_application/Screens/Home/Home/home_screen.dart';
import 'package:grocery_application/Screens/Home/Profile/profile_screen.dart';
import 'package:grocery_application/Screens/Home/Settings/settings_screen.dart';
import 'package:grocery_application/Screens/Home/drawer.dart';
import 'package:grocery_application/Screens/Home/end_drawer.dart';
import 'package:grocery_application/Services/auth_service.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/constants.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:page_transition/page_transition.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  final AuthService _auth = AuthService();

  Widget _screenChooser(int index) {
    switch (index) {
      case 0:
        return ProfileScreen();
      case 1:
        return AddressScreen();
      case 2:
        return HomeScreen();
      case 3:
        return ProfileScreen();
      case 4:
        return SettingsScreen();
      default:
        return new Container(
          child: new Center(
            child: new Text('No Screen Found'),
          ),
        );
    }
  }

  @override
  void initState() {
    Fluttertoast.showToast(msg: "Welcome!!", backgroundColor: Colors.green);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.5,
        title: Text("eBasket",
            style: logoWhiteStyle, textDirection: TextDirection.ltr),
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
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: CartPage()));
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),
      drawer: new MyDrawer(),
      endDrawer: new MyEndDrawer(),
      body: Container(
        child: _screenChooser(currentIndex),
      ),
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

  void logout() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Log out alert!!"),
              content: Text("Are you sure, you want to Log out?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: Text('No')),
                ElevatedButton(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Yes, Log out')),
              ],
            ));
    setState(() {});
  }
}
