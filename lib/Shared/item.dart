import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Shared/Product.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/product_data.dart';
import 'package:grocery_application/Shared/styles.dart';

class ProductItem extends StatefulWidget {
  final Product item;
  final double imgWidth;
  final Function onTapped;
  final bool isProductPage;
  const ProductItem(
      {Key key,
      @required this.item,
      this.imgWidth = 200,
      @required this.onTapped,
      this.isProductPage = false})
      : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: <Widget>[
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 180, height: 180),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: white,
                      elevation: (widget.isProductPage) ? 20 : 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: widget.onTapped,
                  child: Hero(
                      transitionOnUserGestures: true,
                      tag: widget.item.name,
                      child: Image.network(widget.item.image,
                          width: (widget.imgWidth != null)
                              ? widget.imgWidth
                              : 100)))),
          Positioned(
            bottom: (widget.isProductPage) ? 10 : 70,
            right: 0,
            child: IconButton(
              padding: EdgeInsets.all(20),
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
                if (liked) {
                  favourites.add(widget.item);
                  Fluttertoast.showToast(
                      msg: "Added to favourites",
                      backgroundColor: Colors.green);
                } else {
                  favourites.remove(widget.item);
                  Fluttertoast.showToast(
                      msg: "Removed from favourites",
                      backgroundColor: Colors.yellow);
                }
              },
              icon: Icon(
                (liked) ? Icons.favorite : Icons.favorite_border,
                color: (liked) ? primaryColor : darkText,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: (!widget.isProductPage)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.item.name, style: foodNameText),
                      Text('\$' + widget.item.price.toString(),
                          style: priceText),
                    ],
                  )
                : Text(' '),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: (widget.item.discount != null)
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + widget.item.discount.toString() + '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )
                  : SizedBox(width: 0))
        ],
      ),
    );
  }
}
