import 'package:flutter/material.dart';

const kCardColourFirst = Color(0xFFcd06e9);
const kCardColourSecond = Color(0xFF5515db);
const kValueColour = Color(0xFF400b75);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

const BoxDecoration standardDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xFF370f8c), Color(0xFF13072f)],
  ),
);

// InputDecoration(
// contentPadding:
// EdgeInsets.symmetric(vertical: 15, horizontal: 20),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(10)),
// )),