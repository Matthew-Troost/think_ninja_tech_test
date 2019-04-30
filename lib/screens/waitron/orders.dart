import 'package:flutter/material.dart';
import 'package:think_ninja_tech_test/utils/widgets.dart';
import 'package:think_ninja_tech_test/screens/waitron/order.dart';

class Orders extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Button(text: "New Order", function: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Order()),
    );
    },);
  }
}