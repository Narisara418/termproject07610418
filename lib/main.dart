import 'package:flutter/material.dart';
import 'package:termproject07610418/pages/homepage.dart';
import 'package:termproject07610418/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweet Shop',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Homepage(),
    );
  }
}
