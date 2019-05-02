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
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () => widget.navFunction(1),
          child: Text("Back"),
        ),
        OrderForm()
      ],
    );
  }
}

class OrderForm extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Menu Item'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the menu item name';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Notes'),
            maxLines: 5,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a quantity';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Add To Order'),
            ),
          ),
        ],
      ),
    );
  }
}
