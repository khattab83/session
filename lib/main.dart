import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'file:///C:/Users/Flutter/AndroidStudioProjects/fluttersetion/lib/modules/counter_screen/counter.dart';

import 'modules/allbutton.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oswald',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.blue,
//      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/pg.png'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 30),
                      ),
                      IconButton(icon: Icon(Icons.more_horiz), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainButton()));
                      })
                    ],
                  )
                ),
                Container(
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    obscureText: _password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _password = !_password;
                              });
                            },
                            child: Icon(_password == false
                                ? Icons.remove_red_eye
                                : Icons.lock))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCounter()));
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.green,
                      height: 5,
                      width: 150,
                    ),
                    Text(
                      '   OR   ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      color: Colors.green,
                      height: 5,
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                      CIcon(
                        IconMoon.icon_facebook,
                      color: Colors.white
                      ,
                      size: 25,
                    ),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),



                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(

                  height: 45,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CIcon(
                          IconMoon.icon_google,
                          color: Colors.white
                          ,
                          size: 25,
                        ),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    color: Colors.red,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.white70),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'New User? Sign Up',
                          style: TextStyle(color: Colors.white70),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
