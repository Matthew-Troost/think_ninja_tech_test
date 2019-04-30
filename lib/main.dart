import 'package:flutter/material.dart';
import 'package:think_ninja_tech_test/utils/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      home: Layout(),
    );
  }
}


