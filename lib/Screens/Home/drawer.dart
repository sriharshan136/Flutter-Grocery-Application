import 'package:flutter/material.dart';
import 'package:grocery_application/Services/auth_service.dart';
import 'package:grocery_application/Shared/colors.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(170),
        ),
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        lightOrange,
                        orange,
                      ],
                    ),
                  ),
                  accountName: new Text(
                    '',
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: new Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  currentAccountPicture: Icon(
                    Icons.account_circle_sharp,
                    size: 80.0,
                    color: Colors.white,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Profile & Security',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.person,
                    size: 26.0,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.notifications,
                    size: 26.0,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.favorite,
                    size: 26.0,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
                new Divider(
                  color: Colors.black38,
                ),
                new ListTile(
                  title: new Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    //Navigator.pushReplacementNamed(context, Routes.about);
                    //Navigator.popAndPushNamed(context, Routes.app1);
                  },
                  leading: new Icon(
                    Icons.info_outline,
                    size: 26.0,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
                new Divider(
                  color: Colors.black38,
                ),
                new ListTile(
                  title: new Text(
                    'Close Menu',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.close,
                    size: 26.0,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Log Out & Exit',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    logout();
                    // exit(0);
                  },
                  leading: new Icon(
                    Icons.exit_to_app,
                    size: 26.0,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
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
  }
}
