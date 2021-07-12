import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_application/Components/custom_email_input.dart';
import 'package:grocery_application/Components/custom_input_field.dart';
import 'package:grocery_application/Components/custom_password_input.dart';
import 'package:grocery_application/Components/custom_phone_input.dart';
import 'package:grocery_application/Screens/Authenticate/Login/login_screen.dart';

import 'package:grocery_application/Screens/Welcome/welcome_screen.dart';
import 'package:grocery_application/Services/auth_service.dart';
import 'package:grocery_application/Services/database.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/constants.dart';
import 'package:grocery_application/Shared/loading.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;
  const RegisterScreen({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool loading = false;

  // bool loggedIn = false;
  // @override
  // void dispose() {
  //   if (loggedIn) {
  //     Navigator.pushReplacement(
  //         context,
  //         PageTransition(
  //             type: PageTransitionType.fade, child: NavigationBar()));
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: white,
              // automaticallyImplyLeading: false,
              leading: BackButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: WelcomeScreen()));
                },
                color: darkText,
              ),
              centerTitle: true,
              title: Text(
                'Sign Up',
                style: h4,
                textAlign: TextAlign.center,
              ),
            ),
            body: ListView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Let\'s Get Started!', style: h3),
                        Text('Create an account to get all features',
                            style: taglineText),
                        CustomInputField(
                            hintText: 'Name',
                            controller: nameController,
                            icon: Icons.person),
                        CustomEmailInput(
                            hintText: 'Email Address',
                            controller: emailController),
                        CustomPhoneInput(
                            hintText: 'Phone', controller: phoneController),
                        CustomPasswordInput(
                            hintText: 'Password',
                            controller: passwordController),
                        CustomPasswordInput(
                            hintText: 'Confirm Password',
                            controller: confirmPasswordController),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: signUp,
                          child: Text(
                            'CREATE',
                            style: whiteTextBold,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            shape: StadiumBorder(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: h6,
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.of(context).pushReplacementNamed('/signup');
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: LoginScreen()));
                              },
                              child: Text('Login here', style: contrastText),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  height: size.height,
                  width: double.infinity,
                  decoration: authPlateDecoration,
                ),
              ],
            ));
  }

  void signUp() async {
    FormState form = formKey.currentState;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final name = nameController.text;
      final email = emailController.text;
      final phone = phoneController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (password != confirmPassword) {
        Fluttertoast.showToast(
            msg: "Incorrect password", backgroundColor: Colors.red);
      } else {
        setState(() => loading = true);

        dynamic result = await _auth.registerWithEmailAndPassword(
          email,
          password,
        );
        if (result == null) {
          setState(() {
            loading = false;
          });
        } else {
          // create a new document for the user with the uid

          await DatabaseService(result.uid)
              .updateUserData(email, password, name, phone, null);

          Fluttertoast.showToast(
              msg: "Successfully registered!", backgroundColor: Colors.green);
          userId = result.uid;
          setState(() {
            loading = false;
            // loggedIn = true;
          });
        }
      }
    }
  }
}
