import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/login.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flash_chat_flutter/screens/description.dart';
//import 'map.dart';
//import 'page.dart';
//import 'place_marker.dart';

void main() => runApp(FlashChat());

//final List<Page> _allPages = <Page>[
//  MarkerIconsPage(),
//  PlaceMarkerPage(),
//];


class FlashChat extends StatelessWidget {
//  void _pushPage(BuildContext context, Page page) {
//    Navigator.of(context).push(MaterialPageRoute<void>(
//        builder: (_) => Scaffold(
//          appBar: AppBar(title: Text(page.title)),
//          body: page,
//        )));
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: DescriptionPage.id,
      routes: {
        //MarkerIconsBody.id: (context) => MarkerIconsBody();
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        DescriptionPage.id: (context) => DescriptionPage(),
      },
    );
  }
}
