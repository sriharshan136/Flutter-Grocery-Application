import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Screens/Home/Cart/Components/cart_card.dart';
import 'package:grocery_application/Shared/cart.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/constants.dart';
import 'package:grocery_application/Shared/loading.dart';
import 'package:grocery_application/Shared/product_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  int items = cart.length;
  bool isEmpty = (cart.length == 0);
  bool isLoading = false;

  Razorpay _razorpay;
  bool success = false;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Loading
        : Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: black,
              ),
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    "Your Cart",
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
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: (isEmpty)
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          "assets/images/empty_cart.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    : ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Dismissible(
                            key: Key(cart[index].product.name.toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                cart.removeAt(index);
                                items = cart.length;
                                if (cart.length == 0) {
                                  isEmpty = true;
                                }
                                getTotal(cart);
                              });
                            },
                            background: Container(
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
                            child: CartCard(cart: cart[index]),
                          ),
                        ),
                      )),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 30.0,
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 20,
                    color: Color(0xFFDADADA).withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset("assets/icons/receipt.svg"),
                        ),
                        Spacer(),
                        Text("Add voucher code"),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: darkText,
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Total:\n",
                            children: [
                              TextSpan(
                                text: "\$${getTotal(cart)}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 190,
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                primary: lightOrange,
                              ),
                              onPressed: callRazorpay,
                              child: Text(
                                'Check Out',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  double getTotal(List<CartItem> products) {
    int l = products.length;
    double sum = 0.0;
    for (int i = 0; i < l; i++) {
      sum += (products[i].product.price * products[i].quantity);
    }

    int decimals = 2;
    int fac = pow(10, decimals);
    double d = sum;
    d = (d * fac).round() / fac;
    return d;
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: 'Your payment has done successfully' +
            response.paymentId.toString());
    setState(() {
      success = true;
      orders.add(cart);
      cart.clear();
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Your payment has failed and the reason is :' +
            response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'Redirecting to external wallet' + response.walletName.toString());
  }

  void callRazorpay() async {
    setState(() {
      isLoading = true;
    });
    String name = '';
    String email = '';
    String phone = '';
    var docSnapshot = await userCollection.doc(userId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> document = docSnapshot.data();
      setState(() {
        name = document['name'] ?? '';
        email = document['email'] ?? '';
        phone = document['phone'] ?? '';

        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("Error");
    }

    var options = {
      'key': 'rzp_test_q5w4yvnou1XJ6P',
      'amount': getTotal(cart) * 100,
      'name': name,
      'description': 'For order Payment',
      'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (msg) {
      print(msg);
    }
  }
}
