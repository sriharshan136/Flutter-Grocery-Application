import 'package:flutter/material.dart';
import 'package:grocery_application/Screens/Home/Cart/cart_page.dart';
import 'package:grocery_application/Screens/Home/Home/Components/body.dart';
import 'package:grocery_application/Screens/Home/drawer.dart';
import 'package:grocery_application/Screens/Home/end_drawer.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/loading.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final foods = Provider.of<List<FoodProduct>>(context);
    bool isLoading = false;

    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: black),
              elevation: 0.5,
              centerTitle: true,
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
            body: Body(),
          );
  }
}
