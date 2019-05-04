import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order extends StatefulWidget {
  final String orderId;

  const Order({Key key, @required this.orderId}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order APP")),
      body: Column(
        children: <Widget>[
          OrderItemForm(),
          new Expanded(
            child: OrderItems(orderId: widget.orderId),
          )
        ],
      ),
    );
  }
}

class OrderItem {
  String itemName = '';
  String notes = '';
  int quantity = 0;
}

class OrderItemForm extends StatefulWidget {
  @override
  _OrderItemFormState createState() => _OrderItemFormState();
}

class _OrderItemFormState extends State<OrderItemForm> {
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

                  Firestore.instance.runTransaction((transaction) async {

                  });
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

class OrderItems extends StatelessWidget {
  final String orderId;

  const OrderItems({Key key, @required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection("orders")
          .document(this.orderId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text("Loading...");

        return ListView.builder(
          itemCount: snapshot.data["orderItems"].length,
          itemBuilder: (context, index) =>
              _buildListItem(context, snapshot.data["orderItems"][index]),
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, Map orderItem) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(orderItem["name"],
                style: Theme.of(context).textTheme.headline),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xffddddff)),
            padding: const EdgeInsets.all(10.0),
            child: Text(orderItem["quantity"].toString(),
                style: Theme.of(context).textTheme.display1),
          )
        ],
      ),
    );
  }
}
