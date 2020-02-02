import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class DescriptionPage extends StatelessWidget {

  static String id = "description_page";

//  final int value;
//  const StarDisplay({Key key, this.value = 0})
//      : assert(value != null),
//        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//      backgroundColor: Colors.teal,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink[300], Colors.purple[400]],
                )
            ),
          //Container only one widget, Columns multiple widgets
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
//                  SizedBox(
//                    height: 25.0
//                  ),

                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    ),
                  ),
//                  SizedBox(
//                    height: 20.0,
//                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: AssetImage('images/yifan.jpg'),
                      ),
                      Text(
                        'BRUCE LEE',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Master\'s',
                        style: TextStyle(
                          fontFamily: 'Source_Sans_Pro',
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            color: Colors.purple[600],
                          );
                        }),
                      ),
                      SizedBox(
                        height: 20.0,
                        width: 150.0,
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          color: Colors.white, //Card by default is white
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  Icons.library_books,
                                  size: 30.0,
                                  color: Colors.purple,
                                ),
                                title: Text(
                                  'Subjects',
                                  style: TextStyle(
                                    fontFamily: 'Source_Sans_Pro',
                                    fontSize: 18.0,
                                    color: Colors.purple.shade900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 310.0,
                                child: Divider(
                                  color: Colors.purple,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                                child: Text(
                                  'Physics, Chemistry',
                                  style: TextStyle(
                                    color: Colors.purple[700],
                                  ),
                                ),
                              ),
                            ],
                          )

                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                        child: ListTile(
                            leading: Icon(
                              Icons.info_outline,
                              size: 30.0,
                              color: Colors.purple,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Descriptions: Hi! I have 2 years of experience as a private tutor up till undergraduate level. ',
                                style: TextStyle(
                                  fontFamily: 'Source_Sans_Pro',
                                  fontSize: 17.0,
                                  color: Colors.purple.shade900,
                                ),
                              ),
                            )
                        ),
                      ),
                        FloatingActionButton.extended(
                            onPressed: (){Navigator.pushNamed(context, ChatScreen.id);},
                            label: Text('CONTACT'),
                            icon: Icon(Icons.message),
                            backgroundColor: Colors.purple[700],
                        ),
                    ]
            ),
                ],
              )
        ),
      ),
    );
  }
}
