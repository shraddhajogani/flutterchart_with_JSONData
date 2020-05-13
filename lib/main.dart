import 'package:flutter/material.dart';
import 'jsonpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: JsonPage(),
    );
  }
}

