import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Screens/Home/Cart/cart_page.dart';
import 'package:grocery_application/Shared/Product.dart';
import 'package:grocery_application/Shared/cart.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/product_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isLicked = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
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
                color: black,
              )),
        ],
      ),
      backgroundColor: white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Hero(
                        tag: widget.product.name,
                        child: Image.network(
                          widget.product.image,
                          fit: BoxFit.contain,
                          height: size.height * 0.4,
                        ),
                      ),
                    ),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.product.weight,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity -= 1;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: black,
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(color: black),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity += 1;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${widget.product.price}',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'About the product',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'The product description for this grill speaks to the target market (me!) by expressing how its main features address my need for a grill that can squeeze into a tiny balcony space.',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLicked = !isLicked;
                      });
                      if (isLicked) {
                        favourites.add(widget.product);
                        Fluttertoast.showToast(
                            msg: "Added to favourites",
                            backgroundColor: Colors.green);
                      } else {
                        favourites.remove(widget.product);
                        Fluttertoast.showToast(
                            msg: "Removed from favourites",
                            backgroundColor: Colors.yellow);
                      }
                    },
                    icon: Icon(
                      (isLicked) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.green,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    onPressed: () {
                      cart.add(CartItem(
                        product: widget.product,
                        quantity: quantity,
                      ));

                      Fluttertoast.showToast(
                          msg: "Added to cart", backgroundColor: Colors.green);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
