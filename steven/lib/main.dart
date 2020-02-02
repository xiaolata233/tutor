import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/Search_Page.dart';
import 'Description_Page.dart';
import 'Map_Page.dart';
import 'Search_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Map_Page(),
        '/first': (context) => Description_Page(),
        '/second': (context) => Search_Page(),
      },
    );
  }
}
