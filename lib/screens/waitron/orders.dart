import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  final void Function(int index) navFunction;

  const Orders({Key key, @required this.navFunction}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => widget.navFunction(3),
      child: Text("New Order"),
    );
  }
}
