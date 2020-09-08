import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: kDarkBrownColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  fillColor: kExtraLightBrown,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: kDarkBrownColor),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kDarkBrownColor, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter Value',
  hintStyle: TextStyle(color: kDarkBrownColor),
  filled: true,
  fillColor: kExtraLightBrown,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kDarkBrownColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kDarkBrownColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kProgressIndicator = CircularProgressIndicator(
  backgroundColor: kDarkBrownColor,
  valueColor: AlwaysStoppedAnimation<Color>(kBrownColor),
);

const kTextFieldTextStyle = TextStyle(color: kDarkBrownColor);

const kExtraLightBrown = Color(0xFFFFF2D8);
const kLightBrownColor = Color(0xFFF3E0B7);
const kBrownColor = Color(0xFFFAD376);
const kDarkBrownColor = Color(0xFFAA8B4F);
const kExtraDarkBrownColor = Color(0xFF8E713B);
