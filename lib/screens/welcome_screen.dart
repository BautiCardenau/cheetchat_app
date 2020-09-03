import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cheetchatapp/components/RoundedButton.dart';
import 'package:cheetchatapp/constants.dart';
import 'package:cheetchatapp/screens/login_screen.dart';
import 'package:cheetchatapp/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "/welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, //Who is going to act as a ticker? this class
    );

    animation = ColorTween(begin: kBrownColor, end: kLightBrownColor)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 64.0,
                    padding: EdgeInsets.only(right: 15.0),
                  ),
                ),
                Expanded(
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 300),
                    repeatForever: true,
                    text: ['Cheet-Chat'],
                    textStyle: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                text: 'Log in',
                color: kBrownColor,
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, LoginScreen.id);
                  });
                }),
            RoundedButton(
                text: "Register",
                color: kDarkBrownColor,
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  });
                })
          ],
        ),
      ),
    );
  }
}
