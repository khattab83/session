

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewCounter extends StatefulWidget {
  @override
  _NewCounterState createState() => _NewCounterState();
}

class _NewCounterState extends State<NewCounter> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Counter'),
      ),
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: Colors.teal,
                onPressed: (){

                  setState(() {
                    counter--;
                  });
                },child: Text('MINUS'),),
              Text(counter.toString(), style: TextStyle(fontSize: 40),),
              MaterialButton(
                color: Colors.red,
                onPressed: (){

                  setState(() {
                    counter++;
                  });
                }, child: Text('PLUS'),)
            ],
          )
        ],
      ),
    );
  }
}
