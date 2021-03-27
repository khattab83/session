import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersetion/models/timerclass.dart';

class TimerScreen extends StatefulWidget {

  @override

  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _width;
  int _time = 60;
  Timer _everySecond;
  int _mainIndex = 0;
  int _value = 1;
  int _grade = 0;
  bool showResult = false;
  @override
  void initState() {
    super.initState();

    // sets first value
    _width = 0;
    _time = 60;

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _width = _width + 5;
        _time--;
        if (_width >= 300) {
          _everySecond.cancel();
          showResult = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _everySecond.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _everySecond = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_width >= 300) {
                _everySecond.cancel();
              } else {
                _width = _width + 5;
                _time--;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {

    int reminTime = 60 - _time;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Timer'),
      ),
      body: Container(
        color: Colors.yellow,
        child: showResult
            ? resultContainet(text: _grade.toString(), time: reminTime)
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg2.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(_time.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Second',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 30,
                            width: 302,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: _width.toDouble(),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [0.1, 0.5, 0.7, 0.9],
                                      colors: [
                                        Colors.yellow[800],
                                        Colors.yellow[700],
                                        Colors.yellow[600],
                                        Colors.yellow[400],
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                    offset: Offset(0, 5),
                                    spreadRadius: 5)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  questions[_mainIndex].ques,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                for (int i = 0;
                                    i < questions[_mainIndex].answer.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.grey),
                                      ),
                                      child: ListTile(
                                          title: Text(
                                            questions[_mainIndex].answer[i],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          leading: Radio(
                                            value: i,
                                            groupValue: _value,
                                            onChanged: i == 5
                                                ? null
                                                : (int value) {
                                                    setState(() {
                                                      _value = value;
                                                    });
                                                  },
                                          )),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              if (_mainIndex < questions.length - 1) {
                                print(_value);
                                print(questions[_mainIndex].trueAns);
                                if (_value == questions[_mainIndex].trueAns) {
                                  _grade++;
                                }
                                _mainIndex++;
                                //print(_mainIndex);
                              } else {
                                setState(() {
                                  _everySecond.cancel();
                                  showResult = true;
                                });
                              }
                            });
                          },
                          color: Colors.orange,
                          child: Text('Next'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circleButton(
                                onPress: () {
                                  setState(() {
                                    startTimer();
                                  });
                                },
                                color: Colors.green[300],
                                icon: Icons.arrow_forward_ios),
                            circleButton(
                                onPress: () {
                                  setState(() {
                                    _everySecond.cancel();
                                  });
                                },
                                color: Colors.red[300],
                                icon: Icons.clear),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

Widget resultContainet({String text, int time}) {
  return Center(
    child: Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.teal[300],
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 20,
                offset: Offset(0, 5),
                spreadRadius: 5)
          ]),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Score is $text',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Text(
            'Time is $time Seconds',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      )),
    ),
  );
}

Widget circleButton(
    {@required Function onPress,
    @required Color color,
    @required IconData icon}) {
  return MaterialButton(
    onPressed: onPress,
    child: CircleAvatar(backgroundColor: color, child: Icon(icon)),
  );
}
