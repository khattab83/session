import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttersetion/components/allcomponent.dart';
import 'package:fluttersetion/modules/bmi/bmi.dart';
import 'bmi/bmi2.dart';
import 'file:///C:/Users/Flutter/AndroidStudioProjects/fluttersetion/lib/modules/timer_screen/timer.dart';

import 'contact_screen/contact.dart';
import 'counter_screen/counter.dart';
import 'more_screen/moretask.dart';

class MainButton extends StatelessWidget {
  dynamic pushPage(BuildContext ctx, Widget newPage) {
    return Navigator.push(
        ctx, MaterialPageRoute(builder: (context) => newPage));
  }

  @override
  Widget build(BuildContext context) {
    Orientation _orientation= MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/pg.png'), fit: BoxFit.fill)),
        child:_orientation == Orientation.portrait?newContent(context: context): SingleChildScrollView(
          child:newContent(context: context),
        ),
      ),
    );
  }Widget newContent({@required BuildContext context}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: Column(
          children: [
            defaultButtonWithIcon(
              buttonTxt: 'More Task',
              fullWidth: false,
              width: 250,
              icon: Icons.developer_board,
              onTab: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => More()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            defaultButtonWithIcon(
              buttonTxt: 'Counter',
              fullWidth: false,
              width: 250,
              icon: Icons.access_alarm,
              onTab: () {
                pushPage(context, NewCounter());
              },
            ),
            SizedBox(
              height: 15,
            ),
            defaultButtonWithIcon(
              buttonTxt: 'Contacts',
              fullWidth: false,
              width: 250,
              icon: Icons.contact_mail,
              onTab: () {
                pushPage(
                  context,
                  ContactScreen(),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            defaultButtonWithIcon(
              buttonTxt: 'Timer',
              fullWidth: false,
              width: 250,
              icon: Icons.access_time,
              onTab: () {
                pushPage(
                  context,
                  TimerScreen(),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            defaultButtonWithIcon(
              buttonTxt: 'BMI Calculator',
              fullWidth: false,
              width: 250,
              icon: Icons.calculate,
              onTab: () {
                pushPage(
                  context,
                  BmiScreen(),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            defaultButtonWithIcon(
              buttonTxt: 'BMI Calculator2',
              fullWidth: false,
              width: 250,
              icon: Icons.calculate,
              onTab: () {
                pushPage(
                  context,
                  BmiScreen2(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
