import 'package:flutter/material.dart';
import 'package:think_ninja_tech_test/screens/waitron/orders.dart';

class Button extends StatefulWidget {
  final String text;
  final Function function;

  const Button({Key key, @required this.text, @required this.function}) : super(key: key);

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () => widget.function,
              child: Text(widget.text),
            )
          ],
        ),
      ),
    );
  }
}

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Customer'),
    Orders(),
    Text('Index 2: Kitchen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Customer')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_drink), title: Text('Waitron')),
          BottomNavigationBarItem(
              icon: Icon(Icons.kitchen), title: Text('Kitchen')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
