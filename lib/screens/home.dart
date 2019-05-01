import 'package:flutter/material.dart';
import 'package:think_ninja_tech_test/screens/customer.dart';
import 'package:think_ninja_tech_test/screens/kitchen.dart';
import 'package:think_ninja_tech_test/screens/waitron/orders.dart';
import 'package:think_ninja_tech_test/screens/waitron/order.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  widgetList() {
    return [
      Customer(),
      Orders(navFunction: updateWidgetInView),
      Kitchen(),
      Order(navFunction: updateWidgetInView)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order App'),
      ),
      body: widgetList()[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateWidgetInView, // new
        currentIndex: _currentIndex > 2 ? 1 : _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Customer'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            title: Text('Waitron'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            title: Text('Kitchen'),
          )
        ],
      ),
    );
  }

  updateWidgetInView(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
