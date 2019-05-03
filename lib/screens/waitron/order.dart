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

class OrderItem {
  String itemName = '';
  String notes = '';
  int quantity = 0;
}

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  OrderItem orderitem = new OrderItem();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
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
            onSaved: (String value) {
              this.orderitem.itemName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Notes'),
            maxLines: 5,
            onSaved: (String value) {
              this.orderitem.notes = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a quantity';
              }
            },
            onSaved: (String value) {
              this.orderitem.quantity = int.parse(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Adding to order...")));
                } else {
                  setState(() {
                    _autoValidate = true;
                  });
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
