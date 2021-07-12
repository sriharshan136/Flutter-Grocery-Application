import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Components/rounded_button.dart';
import 'package:grocery_application/Components/underline_text_field.dart';
import 'package:grocery_application/Shared/constants.dart';
import 'package:grocery_application/Shared/loading.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final houseController = TextEditingController();
  final localityController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: kPrimaryDarkColor,
                        radius: size.width * 0.125,
                        child: Icon(
                          Icons.location_on_sharp,
                          size: size.width * 0.2,
                          color: kPrimaryLightColor,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      UnderlineTextField(
                        controller: nameController,
                        labelText: 'Full Name',
                      ),
                      UnderlineTextField(
                        controller: houseController,
                        labelText: 'House no. / Building name',
                      ),
                      UnderlineTextField(
                        controller: localityController,
                        labelText: 'Locality',
                      ),
                      UnderlineTextField(
                        controller: cityController,
                        labelText: 'City',
                      ),
                      UnderlineTextField(
                        controller: pincodeController,
                        labelText: 'Pin code',
                      ),
                      SizedBox(height: size.height * 0.02),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RoundedButton(
                          press: addAddress,
                          text: 'ADD ADDRESS',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void addAddress() async {
    final form = formKey.currentState;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final name = nameController.text;
      final house = houseController.text;
      final locality = localityController.text;
      final city = cityController.text;
      final pincode = pincodeController.text;

      String address =
          name + ', ' + house + ', ' + locality + ', ' + city + ', ' + pincode;

      setState(() => loading = true);
      await userCollection.doc(userId).update({'address': address});
      Fluttertoast.showToast(
          msg: "Address updated!", backgroundColor: Colors.green);
      setState(() {
        loading = false;
        currentIndex = profileIndex;
      });
    }
  }
}
