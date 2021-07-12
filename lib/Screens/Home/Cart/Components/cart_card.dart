import 'package:flutter/material.dart';
import 'package:grocery_application/Shared/cart.dart';
import 'package:grocery_application/Shared/colors.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFdae1f5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.orange[200],
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(cart.product.image),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.name,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product.price}",
                  style: TextStyle(fontWeight: FontWeight.w600, color: orange),
                  children: [
                    TextSpan(
                        text: " x ${cart.quantity}",
                        style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(
                        text: "     Cost : ",
                        style: Theme.of(context).textTheme.subtitle1),
                    TextSpan(
                        text: " \$" +
                            (cart.product.price * cart.quantity)
                                .toStringAsFixed(2),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.green)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
