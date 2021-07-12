import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/styles.dart';

class CustomEmailInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomEmailInput(
      {Key key, @required this.hintText, @required this.controller})
      : super(key: key);

  @override
  _CustomEmailInputState createState() => _CustomEmailInputState();
}

class _CustomEmailInputState extends State<CustomEmailInput> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: TextFormField(
        onTap: () {},
        onEditingComplete: () => TextInput.finishAutofillContext(),
        keyboardType: TextInputType.emailAddress,
        cursorColor: primaryColor,
        style: inputFieldTextStyle,
        controller: widget.controller,
        autofillHints: [AutofillHints.email],
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle,
          prefixIcon: Icon(
            Icons.email,
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

  void onListen() {
    setState(() {});
  }
}
