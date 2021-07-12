import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/styles.dart';

class CustomPasswordInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomPasswordInput(
      {Key key, @required this.controller, @required this.hintText})
      : super(key: key);

  @override
  _CustomPasswordInputState createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: TextFormField(
        onTap: () {},
        obscureText: isHidden,
        cursorColor: primaryColor,
        controller: widget.controller,
        style: inputFieldHintPaswordTextStyle,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: (password) => password.length <= 5
            ? 'Password must have at least 5 characters'
            : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: inputFieldHintPaswordTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: isHidden
                ? Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
            onPressed: togglePasswordVisibility,
          ),
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
