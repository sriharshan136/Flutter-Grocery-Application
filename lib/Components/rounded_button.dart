import 'package:flutter/material.dart';
import 'package:grocery_application/Shared/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    @required this.text,
    @required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shadowColor: Colors.grey[700],
          elevation: 8.0,
          shape: StadiumBorder(),
          side: BorderSide(color: color),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        ),
      ),
    );
  }
}
