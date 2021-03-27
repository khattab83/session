import 'package:flutter/material.dart';
import 'package:fluttersetion/models/contactClass.dart';

Widget defaultButtonWithIcon({
  @required bool fullWidth,
  @required String buttonTxt,
  Color buttonTxtColor = Colors.white,
  double width,
  Color buttonColor = Colors.teal,
  @required IconData icon,
  @required Function onTab,
}) {
  return Container(
    width: fullWidth ? double.infinity : width ?? null,
    color: buttonColor,
    child: MaterialButton(
        onPressed: onTab,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(width: 30,),
            Text(
              buttonTxt,
              style: TextStyle(color: buttonTxtColor, fontSize: 20),
            ),

          ],
        )),
  );
}

Widget contactContainer({
  @required List<Contact> mycontact,
  @required int index,
}) {
  return Container(
    height: 75,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.teal[300],
            child: Text(
              mycontact[index].name.characters.take(2).toString().toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mycontact[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(mycontact[index].phone,
                  style: TextStyle(fontSize: 15, color: Colors.grey))
            ],
          )
        ],
      ),
    ),
  );
}
Widget customDivider(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: 1,
    ),
  );
}