
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class MyTitledNavigationBar extends StatefulWidget{
  @override
  _MyTitledNavigationBarState createState()=>_MyTitledNavigationBarState();
}

class _MyTitledNavigationBarState extends State<MyTitledNavigationBar>{
    final List<TitledNavigationBarItem> items = [
      TitledNavigationBarItem(title: Text('Home'),icon: Icon(Icons.home)),
      TitledNavigationBarItem(title: Text('Search'),icon: Icon(Icons.search)),
      TitledNavigationBarItem(title: Text('Bag'),icon: Icon(Icons.card_travel)),
      TitledNavigationBarItem(title: Text('Orders'),icon: Icon(Icons.shopping_cart)),
      TitledNavigationBarItem(title: Text('Profile'),icon: Icon(Icons.person_outline)),
    ] ;
    buildAnmin
    bool navBarMode = false;

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Titled Bottom Bar'),
        ),
        body: Center(
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Reversed mode:'),
              Switch(
                  value: navBarMode,
                  onChanged: (v){
                    setState(() => navBarMode =v);
                  },),
            ],
          ),
        ),
        bottomNavigationBar: TitledBottomNavigationBar(
          height: 60,
          indicatorHeight: 2,
          onTap: (index)=>print("Selected Index: $index") ,
          reverse: navBarMode,
          curve: Curves.easeInBack,
          items:items,
          activeColor: Colors.red,
          inactiveColor: Colors.blueGrey,
        ),
      );
    }
}