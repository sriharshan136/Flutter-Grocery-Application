import 'package:flutter/material.dart';
import 'package:grocery_application/Shared/Product.dart';
import 'package:grocery_application/Shared/colors.dart';

class FavouriteCard extends StatelessWidget {
  final Product favourite;
  const FavouriteCard({Key key, @required this.favourite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFf5daef),
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
                child: Image.network(favourite.image),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favourite.name,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${favourite.price}",
                  style: TextStyle(fontWeight: FontWeight.w600, color: orange),
                  children: [
                    TextSpan(
                        text: " x 1",
                        style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(
                        text: "     Cost : ",
                        style: Theme.of(context).textTheme.subtitle1),
                    TextSpan(
                        text: " \$" + (favourite.price * 1).toStringAsFixed(2),
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
