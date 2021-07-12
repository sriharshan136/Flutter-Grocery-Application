import 'package:flutter/material.dart';

class TestingScreen extends StatelessWidget {
  static const routeName = "/testing-screen";
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: mediaQuery.size.height * 0.1,
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(150),
                    bottomLeft: Radius.circular(150))),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: mediaQuery.size.height,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                  child: Center(child: Text('data')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
