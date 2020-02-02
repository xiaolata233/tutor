import 'package:flutter/material.dart';

class Map_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Map Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text('Go To Description Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Go To Search Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}
