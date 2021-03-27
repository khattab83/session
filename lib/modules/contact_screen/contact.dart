import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersetion/components/allcomponent.dart';
import 'package:fluttersetion/models/contactClass.dart';
class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = 'khalid';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Contact'),
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemCount: myContact.length,
        separatorBuilder: (context, index) {
          return  customDivider();//Divider(height: 20,);
        },
        itemBuilder: (context, index) {
          return contactContainer(index: index, mycontact:myContact );
        },
      ),
    );
  }
}

