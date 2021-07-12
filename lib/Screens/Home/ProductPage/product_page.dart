import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Components/custom_buttons.dart';
import 'package:grocery_application/Screens/Home/Cart/cart_page.dart';
import 'package:grocery_application/Shared/Product.dart';
import 'package:grocery_application/Shared/cart.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/item.dart';
import 'package:grocery_application/Shared/product_data.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductPage extends StatefulWidget {
  final String pageTitle;
  final Product productData;
  const ProductPage({Key key, this.pageTitle, this.productData})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double _rating = 4;
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text(widget.productData.name, style: h4),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: CartPage()));
                },
                icon: Icon(
                  MdiIcons.cart,
                  color: darkText,
                )),
          ],
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 100, bottom: 100),
                        padding: EdgeInsets.only(top: 100, bottom: 50),
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(widget.productData.name, style: h5),
                            Text("\$" + widget.productData.price.toString(),
                                style: h3),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 20),
                              child: SmoothStarRating(
                                allowHalfRating: false,
                                onRated: (value) {
                                  setState(() {
                                    _rating = value;
                                  });
                                },
                                starCount: 5,
                                rating: _rating,
                                size: 27.0,
                                color: Colors.orange,
                                borderColor: Colors.orange,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 25),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text('Quantity', style: h6),
                                    margin: EdgeInsets.only(bottom: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 55,
                                        height: 55,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              _quantity += 1;
                                            });
                                          },
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(_quantity.toString(),
                                            style: h3),
                                      ),
                                      Container(
                                        width: 55,
                                        height: 55,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_quantity == 1) return;
                                              _quantity -= 1;
                                            });
                                          },
                                          child: Icon(Icons.remove),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              child: customOutlineButton('Buy Now', () {}),
                            ),
                            Container(
                              width: 180,
                              child: customButton('Add to Cart', () {
                                cart.add(CartItem(
                                    product: widget.productData,
                                    quantity: _quantity));

                                Fluttertoast.showToast(
                                    msg: "Added to cart",
                                    backgroundColor: Colors.green);
                              }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  color: Color.fromRGBO(0, 0, 0, .05))
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        height: 160,
                        child: ProductItem(
                          item: widget.productData,
                          isProductPage: true,
                          onTapped: () {},
                          imgWidth: 250,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
