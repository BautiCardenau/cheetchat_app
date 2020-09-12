import 'package:cheetchatapp/screens/chat_list_screen.dart';
import 'package:cheetchatapp/screens/chat_screen.dart';
import 'package:cheetchatapp/screens/login_screen.dart';
import 'package:cheetchatapp/screens/new_chat_screen.dart';
import 'package:cheetchatapp/screens/registration_screen.dart';
import 'package:cheetchatapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CheetChat());
}

class CheetChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatListScreen.id: (context) => ChatListScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        NewChatScreen.id: (context) => NewChatScreen(),
      },
    );
  }
}
