import 'package:cheetchatapp/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewChatScreen extends StatefulWidget {
  static const String id = "/newChat";

  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBrownColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SearchBar<String>(
                //TODO:  no se si se puede buscar usuarios asi que repensar esto
                searchBarPadding: EdgeInsets.all(8.0),
                icon: Icon(
                  Icons.search,
                  color: kLightBrownColor,
                  size: 30.0,
                ),
                searchBarStyle: SearchBarStyle(
                  backgroundColor: kExtraLightBrown,
                ),
                textStyle: kTextFieldTextStyle.copyWith(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
                onItemFound: (String string, int index) {
                  return Text(string + index.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
