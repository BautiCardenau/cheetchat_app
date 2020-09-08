import 'package:cheetchatapp/components/MessageBubble.dart';
import 'package:cheetchatapp/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:intl/intl.dart';

final _firestore = Firestore.instance;
User loggedInUser;

class ChatListScreen extends StatefulWidget {
  static const String id = "/chatList";

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextEditController = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBrownColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kDarkBrownColor),
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.close,
                color: kDarkBrownColor,
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text(
          'Chats',
          style: TextStyle(color: kDarkBrownColor),
        ),
        backgroundColor: kExtraLightBrown,
      ),
      body: SafeArea(child: ChatsStream()),
    );
  }
}

class ChatsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('chats')
          .orderBy('lastDate', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Expanded(
            child: Center(
              child: kProgressIndicator,
            ),
          );
        }
        final chats = snapshot.data.docs;
        List<ChatBubble> chatsList = [];
        for (var chat in chats) {
          var lastText = chat.get('lastText');
          var chatUser = chat.get('user');
          var chatID = chat.id;
          var dateFormat = DateFormat('dd/MM/yyyy');
          var lastDate = dateFormat.format(
              new DateTime.fromMicrosecondsSinceEpoch(
                  chat.get('lastDate').microsecondsSinceEpoch));

          final currentUser = loggedInUser.email;

          final chatBubble = ChatBubble(
            chatID: chatID,
            chatUser: chatUser,
            lastText: lastText,
            lastDate: lastDate,
            onPressed: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
          );
          chatsList.add(chatBubble);
        }

        return Expanded(
            child: ListView(
          children: chatsList,
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        ));
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble(
      {this.chatID,
      this.chatUser,
      this.lastText,
      this.lastDate,
      this.onPressed});

  final chatID;
  final chatUser;
  final lastText;
  final lastDate;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            elevation: 2.0,
            color: kExtraLightBrown,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: FlatButton(
                onPressed: onPressed,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          chatUser,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: kDarkBrownColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          lastDate,
                          style: TextStyle(
                              color: kExtraDarkBrownColor, fontSize: 12.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      lastText,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kDarkBrownColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
