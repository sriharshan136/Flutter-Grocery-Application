import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:grocery_application/Components/custom_chechbox.dart';
import 'package:grocery_application/Components/custom_email_input.dart';
import 'package:grocery_application/Components/custom_password_input.dart';
import 'package:grocery_application/Components/or_divider.dart';
import 'package:grocery_application/Screens/Authenticate/Register/register_screen.dart';

import 'package:grocery_application/Screens/Welcome/welcome_screen.dart';
import 'package:grocery_application/Services/auth_service.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/constants.dart';
import 'package:grocery_application/Shared/loading.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  const LoginScreen({
    Key key,
    this.toggleView,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                'Sign In',
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
                        Text('Welcome Back!', style: h3),
                        Text('Login to your existant account',
                            style: taglineText),
                        CustomEmailInput(
                            hintText: 'Email Address',
                            controller: emailController),
                        CustomPasswordInput(
                            hintText: 'Password',
                            controller: passwordController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomCheckBox(),
                            Text('Remember me', style: contrastTextBold2),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text('Forgot Password?',
                                  style: contrastTextBold2),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: signIn,
                          child: Text(
                            'LOG IN',
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
                          height: size.height * 0.08,
                        ),
                        OrDivider(),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: size.width * 0.4, height: 40),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Loading()));
                                },
                                icon: Icon(
                                  MdiIcons.facebook,
                                  color: white,
                                ),
                                label: Text(
                                  'Facebook',
                                  style: whiteText,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: size.width * 0.4, height: 40),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  MdiIcons.google,
                                  color: white,
                                ),
                                label: Text(
                                  'Google',
                                  style: whiteText,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: h6,
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.of(context).pushReplacementNamed('/signup');
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: RegisterScreen()));
                              },
                              child: Text('Sign Up', style: contrastText),
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

  void signIn() async {
    FormState form = formKey.currentState;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final email = emailController.text;
      final password = passwordController.text;

      setState(() => loading = true);

      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if (result != null) {
        userId = result.uid;
        // loggedIn = true;
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }
}
