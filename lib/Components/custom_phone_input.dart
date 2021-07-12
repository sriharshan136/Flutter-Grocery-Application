import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/styles.dart';

class CustomPhoneInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomPhoneInput(
      {Key key, @required this.hintText, @required this.controller})
      : super(key: key);

  @override
  _CustomPhoneInputState createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: TextFormField(
        onTap: () {},
        onEditingComplete: () => TextInput.finishAutofillContext(),
        keyboardType: TextInputType.phone,
        cursorColor: primaryColor,
        style: inputFieldTextStyle,
        controller: widget.controller,
        autofillHints: [AutofillHints.telephoneNumber],
        validator: (value) => value.isEmpty ? 'Please Fill' : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle,
          prefixIcon: Icon(
            Icons.call,
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
