import 'package:flutter/material.dart';
import 'package:grocery_application/Shared/constants.dart';

class UnderlineTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  const UnderlineTextField({
    Key key,
    @required this.labelText,
    @required this.controller,
  }) : super(key: key);

  @override
  _UnderlineTextFieldState createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.indigo[900],
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: kPrimaryDarkColor,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkColor)),
        ),
        validator: (value) => value == null ? 'Please Fill' : null,
      ),
    );
  }
}
