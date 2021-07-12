import 'package:flutter/material.dart';
import 'package:grocery_application/Shared/Product.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  const ItemCard({Key key, @required this.product}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  double _rating = 4.0;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      shadowColor: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Hero(
              tag: widget.product.name,
              child: Image.network(
                widget.product.image,
                fit: BoxFit.contain,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Column(
            children: [
              Text(widget.product.name,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black)),
              Text(widget.product.weight,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.grey[700])),
              Text("\$" + widget.product.price.toString(),
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.grey[700])),
              SmoothStarRating(
                allowHalfRating: false,
                onRated: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
                starCount: 5,
                rating: _rating,
                size: 22.0,
                color: Colors.orange,
                borderColor: Colors.orange,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
