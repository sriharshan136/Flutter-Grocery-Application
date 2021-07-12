import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/styles.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  const CustomInputField(
      {Key key,
      @required this.hintText,
      @required this.controller,
      @required this.icon})
      : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: TextFormField(
        onTap: () {},
        onEditingComplete: () => TextInput.finishAutofillContext(),
        autofillHints: [AutofillHints.name],
        cursorColor: primaryColor,
        controller: widget.controller,
        style: inputFieldTextStyle,
        validator: (value) => value.isEmpty ? 'Please Fill' : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey,
          ),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey,
                  onPressed: () => widget.controller.clear(),
                ),
        ),
      ),
    );
  }
}
