import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:grocery_application/Models/user.dart';
import 'package:grocery_application/Screens/Authenticate/Login/login_screen.dart';
import 'package:grocery_application/Screens/Authenticate/Register/register_screen.dart';
import 'package:grocery_application/Screens/Home/Address/address_screen.dart';
import 'package:grocery_application/Screens/Home/Home/home_screen.dart';
import 'package:grocery_application/Screens/Home/Profile/profile_screen.dart';
import 'package:grocery_application/Screens/Welcome/welcome_screen.dart';
import 'package:grocery_application/Screens/test_screen.dart';
import 'package:grocery_application/Screens/wrapper.dart';
import 'package:grocery_application/Services/auth_service.dart';
import 'package:grocery_application/Shared/colors.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<CustomUser>.value(
          value: AuthService().user,
          initialData: null,
          catchError: (_, __) => null,
        ),
        // StreamProvider<List<FoodProduct>>.value(
        //   value: DatabaseService(null).foodData(),
        //   catchError: (_, __) => null,
        //   initialData: null,
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Application',
        theme: ThemeData(
            primaryColor: Colors.orangeAccent[700],
            scaffoldBackgroundColor: bgColor),
        initialRoute: "/WelcomeScreen",
        routes: {
          "/WelcomeScreen": (context) => WelcomeScreen(),
          "/LoginScreen": (context) => LoginScreen(),
          "/RegisterScreen": (context) => RegisterScreen(),
          "/HomeScreen": (context) => HomeScreen(),
          "/ProfileScreen": (context) => ProfileScreen(),
          "/AddressScreen": (context) => AddressScreen(),
          "/Wrapper": (context) => Wrapper(),
          "/TestingScreen": (context) => TestingScreen(),
        },

        // home: WelcomeScreen(),
      ),
    );
  }
}
