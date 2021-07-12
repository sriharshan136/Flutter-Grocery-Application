import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Screens/Home/Favourite/Components/favourite_card.dart';
import 'package:grocery_application/Shared/cart.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/product_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int items = favourites.length;
  bool isEmpty = (favourites.length == 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Favourites",
              style: TextStyle(color: black),
            ),
            Text(
              "$items items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
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
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: (isEmpty)
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/images/favourites_empty.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Favourites is Empty",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontSize: 30),
                        ),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: favourites.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(favourites[index].name.toString()),
                      direction: DismissDirection.horizontal,
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "Are you sure you want to remove ${favourites[index].name}?"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          favourites.removeAt(index);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          cart.add(CartItem(
                            product: favourites[index],
                            quantity: 1,
                          ));

                          Fluttertoast.showToast(
                              msg: "Added to cart",
                              backgroundColor: Colors.green);

                          setState(() {
                            favourites.removeAt(index);
                            items = favourites.length;
                            if (favourites.length == 0) {
                              isEmpty = true;
                            }
                          });
                        }
                        return null;
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF49fc73),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.shopping_cart),
                            Spacer(),
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFfc6749),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(MdiIcons.trashCan),
                          ],
                        ),
                      ),
                      child: FavouriteCard(favourite: favourites[index]),
                    ),
                  ),
                )),
    );
  }
}
