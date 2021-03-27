import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double _weight = 50;
  double _height = 100;
  int _age = 25;
  bool _isMale = true;
  double _bodyFat=20.2;
  String _bodyState='Normal';
  int image=1;
  Color _stateColor= Colors.green;

  TextStyle resStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);


  double bmiRes() {
    double res = _weight / pow(_height / 100, 2);
    return res;
  }

  double bodyFat() {
    if(_isMale){
     return _bodyFat=(1.2*bmiRes())+(0.23*_age)-16.2;
    }else{
      return _bodyFat=(1.2*bmiRes())+(0.23*_age)-5.4;

    }

  }

  String bmiState(){
    if ( bmiRes()>=35){
      image=4;
      _stateColor= Colors.deepOrange;
      return _bodyState='Obesity level II';
    }else if ( bmiRes()>=30){
      image=3;
      _stateColor= Colors.orange[500];
      return _bodyState='Obesity level I';
    }else if ( bmiRes()>=25){
      image=2;
      _stateColor= Colors.yellow[300];
      return _bodyState='Overweight';
    }else if ( bmiRes()>=19){
      image=1;
      _stateColor= Colors.green;
      return _bodyState='Normal';
    }else {
      image=0;
      _stateColor= Color(0xff9abbda);
      return _bodyState='Under Weight';
    }
  }

  @override
  Widget build(BuildContext context) {
    Orientation _orientation=MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg3.png',),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          offset: Offset(0, 5),
                          blurRadius: 20,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff97c895),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '${_weight.toInt()}',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrangeAccent,
                                                ),
                                          ),
                                          Text(
                                            'KG',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrangeAccent,textBaseline: TextBaseline.ideographic),

                                          ),
                                        ],
                                      ),
                                      Slider(
                                        activeColor: Colors.deepOrangeAccent,
                                        inactiveColor: Colors.white,
                                        max: 200,
                                        min: 50,
                                        divisions: 150,
                                        value: _weight,
                                        onChanged: (value) {
                                          setState(() {
                                            _weight = value;
                                            bmiRes();
                                            bodyFat();
                                            bmiState();
                                          });
                                        },
                                      ),
                                      Text(
                                        'WEIGHT',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrangeAccent),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '${_height.toInt()}',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigo),
                                          ),
                                          Text(
                                            'CM',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigo),
                                          ),
                                        ],
                                      ),
                                      Slider(
                                        activeColor: Colors.indigo,
                                        inactiveColor: Colors.white,
                                        max: 250,
                                        min: 50,
                                        divisions: 200,
                                        value: _height,
                                        onChanged: (value) {
                                          setState(() {
                                            _height = value.roundToDouble();
                                            bmiRes();
                                            bodyFat();
                                            bmiState();
                                          });
                                        },
                                      ),
                                      Text(
                                        'HEIGHT',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Color(0xffffffff),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isMale = true;
                                            bmiRes();
                                            bodyFat();
                                            bmiState();
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xff546e7a),
                                          maxRadius: 20,
                                          child: FaIcon(
                                            FontAwesomeIcons.mars,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isMale = false;
                                            bmiRes();
                                            bodyFat();
                                            bmiState();
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xff546e7a),
                                          maxRadius: 20,
                                          child: FaIcon(
                                            FontAwesomeIcons.venus,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                            ),
                            Expanded(
                                child: Container(
                              color: Color(0xffb5e7e8),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'BMI',
                                          style: resStyle,
                                        ),
                                        Text(
                                          "${bmiRes().toStringAsFixed(1)}",
                                          style: resStyle.copyWith(fontSize: 28),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Body Fat ',
                                          style: resStyle,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              '${_bodyFat.toStringAsFixed(1)}',
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                            ),
                                            Text(
                                              '%',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepOrangeAccent,textBaseline: TextBaseline.ideographic),

                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                            Expanded(
                              child: Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    _age.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _age--;
                                            bmiRes();
                                            bodyFat();
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xff546e7a),
                                          maxRadius: 20,
                                          child: FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _age++;
                                            bmiRes();
                                            bodyFat();
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xff546e7a),
                                          maxRadius: 20,
                                          child: FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // MediaQuery.of(context).orientation==Orientation.portrait
                _orientation==Orientation.portrait? Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(_isMale?'images/body/image$image.png':'images/women/image$image.png'),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 6,
                            offset: Offset(0, 5),
                            blurRadius: 20,
                          ),
                        ]),
                    child: Stack(
                      children: [
                        Positioned(
                          left:30,
                          bottom: 250,
                          child: CircleAvatar(
                            backgroundColor: _isMale? Colors.teal: Colors.orange,
                            maxRadius: 20,
                            child: FaIcon(
                              _isMale?FontAwesomeIcons.mars:FontAwesomeIcons.venus,
                              color: Colors.white,
                            ),
                          ),
                        ),Positioned(
                          left:75,
                          bottom: 260,
                          child:Text(_isMale?'Male':'Female'),
                        ),
                        Positioned(
                          right:100,
                          bottom: 250,
                          child:Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: _stateColor,
                                maxRadius: 20,
                              ),
                                                         ],
                          )
                        ),
                        Positioned(
                            right:25,
                            bottom: 260,
                            child:Text(_bodyState)
                        ),
                      ],
                    ),
                  ),
                ):Center(child: Text('IBM Calculator v:1.0',style: resStyle.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.normal
                ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

