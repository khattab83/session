import 'package:fluttersetion/models/bmiClass.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiScreen2 extends StatefulWidget {
  @override
  _BmiScreen2State createState() => _BmiScreen2State();
}

class _BmiScreen2State extends State<BmiScreen2> {
  double _weight = 80;
  double _height = 180;
  int _age = 25;
  bool _isMale = true;
  double _bodyFat = 20.2;
  String _bodyState = 'Normal';
  int _image = 1;
  Color _stateColor = Colors.green;

  TextStyle resStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    Bmi bmiData = Bmi(
        image: _image,
        age: _age,
        bodyFats: _bodyFat,
        bodyState: _bodyState,
        height: _height,
        weight: _weight,
        isMale: _isMale,
        stateColor: _stateColor);

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/bg3.png',
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _orientation == Orientation.portrait
                  ? Column(
                      children: [
                        mainContainer(bmiData: bmiData),
                        SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        imageContainer(bmiData: bmiData)
                      ],
                    )
                  : Row(
                      children: [
                        imageContainer(bmiData: bmiData),
                        SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        mainContainer(bmiData: bmiData)
                      ],
                    )),
        ),
      ),
    );
  }

  Widget newSlider({@required Color activeColor,
    @required double max,
    @required double min,
    @required int divisions,
    @required double val,
    @required Function onChanged,
  }) {
    return Slider(
      activeColor: activeColor,
      inactiveColor: Colors.white,
      max: max,
      min: min,
      divisions: divisions,
      value: val,
      label: val.round().toString(),
      onChanged: onChanged,
    );
  }

  Widget imageContainer({@required Bmi bmiData}) {
    return Expanded(
      child: Container(
        width: double.infinity,
        // height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(_isMale
                  ? 'images/body/image${bmiData.bmiStateImage()}.png'
                  : 'images/women/image${bmiData.bmiStateImage()}.png'),
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
                left: 45,
                bottom: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.teal[100],
                  ),
                  width: 90,
                  child: Text(
                    bmiData.bmiState(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
              left: 10,
              bottom: 250,
              child: CircleAvatar(
                backgroundColor: _isMale ? Colors.teal : Colors.orange,
                maxRadius: 20,
                child: FaIcon(
                  _isMale ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 55,
              bottom: 260,
              child: Text(_isMale ? 'Male' : 'Female'),
            ),
            Positioned(
                left: 10,
                bottom: 30,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.teal[100],
                      maxRadius: 20,
                    ),
                  ],
                )),
            Positioned(
                left: 16,
                bottom: 35,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: bmiData.bmiStateColor(),
                      maxRadius: 15,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget mainContainer({@required Bmi bmiData}) {
    return Expanded(
      child: Container(
        // height: 300,
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
                                      color: Colors.deepOrangeAccent,
                                      textBaseline: TextBaseline.ideographic),
                                ),
                              ],
                            ),
                            newSlider(
                                divisions: 150,
                                activeColor: Colors.deepOrangeAccent,
                                max: 200,
                                min: 50,
                                val: _weight,
                                onChanged: (value) {
                                  setState(() {
                                    _weight = value;
                                    bmiData.bmiRes();
                                    bmiData.bodyFat();
                                    bmiData.bmiState();
                                  });
                                }),
                            // newSlider(divisions: 200, activeColor:  Colors.indigo, max: 250, min: 50, val: _height,bmiData: bmiData)

                            // Slider(
                            //   activeColor: Colors.deepOrangeAccent,
                            //   inactiveColor: Colors.white,
                            //   max: 200,
                            //   min: 50,
                            //   divisions: 150,
                            //   value: _weight,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       _weight = value;
                            //       // Bmi bmiData=Bmi(image:_image ,age: _age,bodyFats: 20.2,bodyState: 'Normal',height:_height,weight: _weight,isMale: _isMale,stateColor: _stateColor );
                            //       bmiData.bmiRes();
                            //       bmiData.bodyFat();
                            //       bmiData.bmiState();
                            //     });
                            //   },
                            // ),
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
                            newSlider(
                                divisions: 200,
                                activeColor: Colors.indigo,
                                max: 250,
                                min: 50,
                                val: _height,
                                onChanged: (value) {
                                  setState(() {
                                    _height = value.roundToDouble();
                                    bmiData.bmiRes();
                                    bmiData.bodyFat();
                                    bmiData.bmiState();
                                    bmiData.bmiStateImage();
                                  });
                                }),
                            // , Slider(
                            //    activeColor: Colors.indigo,
                            //    inactiveColor: Colors.white,
                            //    max: 250,
                            //    min: 50,
                            //    divisions: 200,
                            //    value: _height,
                            //    onChanged: (value) {
                            //      setState(() {
                            //        _height = value.roundToDouble();
                            //        // Bmi bmiData=Bmi(image:_image ,age: _age,bodyFats: 20.2,bodyState: 'Normal',height:_height,weight: _weight,isMale: _isMale,stateColor: _stateColor );
                            //        bmiData.bmiRes();
                            //        bmiData.bodyFat();
                            //        bmiData.bmiState();
                            //        bmiData.bmiStateImage();
                            //      });
                            //    },
                            //  ),
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
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isMale = true;
                                  // Bmi bmiData=Bmi(image:_image ,age: _age,bodyFats: 20.2,bodyState: 'Normal',height:_height,weight: _weight,isMale: _isMale,stateColor: _stateColor );
                                  bmiData.bmiRes();
                                  bmiData.bodyFat();
                                  bmiData.bmiState();
                                  bmiData.bmiStateImage();
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
                                  // Bmi bmiData=Bmi(image:_image ,age: _age,bodyFats: 20.2,bodyState: 'Normal',height:_height,weight: _weight,isMale: _isMale,stateColor: _stateColor );
                                  bmiData.bmiRes();
                                  bmiData.bodyFat();
                                  bmiData.bmiState();
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'BMI',
                                style: resStyle,
                              ),
                              Text(
                                "${bmiData.bmiRes().toStringAsFixed(1)}",
                                style: resStyle.copyWith(fontSize: 28),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    '${bmiData.bodyFat().toStringAsFixed(1)}',
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
                                        color: Colors.deepOrangeAccent,
                                        textBaseline: TextBaseline.ideographic),
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
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          _age.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _age--;
                                  bmiData.bmiRes();
                                  bmiData.bodyFat();
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
                                  bmiData.bmiRes();
                                  bmiData.bodyFat();
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
    );
  }
}
