import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final void Function(int index) navFunction;

  const Order({Key key, @required this.navFunction}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => widget.navFunction(1),
      child: Text("Back"),
    );
  }
}