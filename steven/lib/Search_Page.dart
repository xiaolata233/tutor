import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Constants.dart';
import 'Bottom_Button.dart';
import 'Education_Card.dart';
import 'package:loading_animations/loading_animations.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page>
    with TickerProviderStateMixin {
  String subjectName;

  AnimationController controller;
  Animation animation;
  @override
//  void initState() {
//    super.initState();
//
//    controller = AnimationController(
//      duration: Duration(seconds: 1),
//      vsync: this,
//      // upperBound: 100.0,
//    );
//
//    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
//
//    controller.reverse(from: 100.0);
//    controller.addListener(() {
//      setState(
//        () {
//          print(animation.value);
//        },
//      );
//    });
//  }
  String gender = 'Male';
  double gpa = 3.0;
  String educationLevel = 'Default';

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                //Colors.pink[200],
                Colors.pink[300],
                //Colors.purple[200],
                Colors.purple[400],
                //Colors.purple[200],
              ],
            ),
//          image: DecorationImage(
//            image: AssetImage('images/searchPageBG.jpg'),
//            fit: BoxFit.cover,
//          ),
            // border: Border.all(width: animation.value * 100),
          ),
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Search for Tutors!',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: <Widget>[
                  // Top Search Bar
                  Container(
                    padding: EdgeInsets.only(top: 40.0, right: 20.0),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop((context));
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 20,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.purple[700],
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextField(
                                    onChanged: (value) {
                                      subjectName = value;
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.school,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Enter subject',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//                  SizedBox(
//                    height: 30.0,
//                  ),
                  // Gender selection
                  Card(
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Gender: ',
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        DropdownButton<String>(
                          value: gender,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          hint: Text('Select gender'),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Dosis'),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          items: <String>[
                            'Male',
                            'Female',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              gender = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
//                SizedBox(
//                  height: 5.0,
//                ),
                  // min GPA slider
                  Card(
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'min GPA',
                            style: TextStyle(
                              fontFamily: 'Dosis',
                              fontSize: 30.0,
                              color: Colors.white,
                            ), // redo style
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          // to use baseline CrossAxisAlignment, must specify textBaseline
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              gpa.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: gpa,
                            min: 1.0,
                            max: 4.0,
                            onChanged: (double newValue) {
                              setState(() {
                                gpa = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
//                SizedBox(
//                  height: 30.0,
//                ),
                  // Education level
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              educationLevel = "Bachelor's";
                            });
                            print('pressed');
                          },
                          child: Container(
                            child: Card(
                              color: (educationLevel == "Bachelor's"
                                  ? kActiveCardColor
                                  : kInactiveCardColor),
                              child: Center(
                                child: Text(
                                  "Bachelor's",
                                  style: TextStyle(
                                      fontFamily: 'Dosis', color: Colors.white),
                                ),
                              ),
                            ),
                            margin: EdgeInsets.all(15.0),
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              educationLevel = "Master";
                            });
                            print('pressed');
                          },
                          child: Container(
                            child: Card(
                              color: (educationLevel == 'Master'
                                  ? kActiveCardColor
                                  : kInactiveCardColor),
                              child: Center(
                                child: Text(
                                  "Master",
                                  style: TextStyle(
                                      fontFamily: 'Dosis', color: Colors.white),
                                ),
                              ),
                            ),
                            margin: EdgeInsets.all(15.0),
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              educationLevel = "PHD";
                            });
                            print('pressed');
                          },
                          child: Container(
                            child: Card(
                              color: (educationLevel == 'PHD'
                                  ? kActiveCardColor
                                  : kInactiveCardColor),
                              child: Center(
                                child: Text(
                                  "PHD",
                                  style: TextStyle(
                                      fontFamily: 'Dosis', color: Colors.white),
                                ),
                              ),
                            ),
                            margin: EdgeInsets.all(15.0),
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
//                SizedBox(
//                  height: 30.0,
//                ),
                  // find tutor button to start searching
                  BottomButton(
                    buttonTitle: 'FIND',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
//                  FlatButton(
//                    onPressed: () {
//                      Navigator.pop(context, subjectName);
//                    },
//                    child: Text(
//                      'Find Tutor',
//                      style: TextStyle(fontSize: 30.0, color: Colors.white),
//                    ),
//                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//            Align(
//              alignment: Alignment.topLeft,
//              child: FlatButton(
//                onPressed: () {
//                  Navigator.pop((context));
//                },
//                child: Icon(
//                  Icons.arrow_back_ios,
//                  size: 50.0,
//                ),
//              ),
//            ),
