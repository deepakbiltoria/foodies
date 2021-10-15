import 'package:flutter/material.dart';
import 'package:foodies/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies food delivery app Ui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.green[200],
          primaryColor: Colors.blueGrey),
      home: HomePage(),
    );
  }
}
