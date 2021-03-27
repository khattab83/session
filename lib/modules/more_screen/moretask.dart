import 'package:koukicons/assistant.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  final double kPadding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'More',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData.fallback().copyWith(),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kPadding,
            ),
            newListTile('تغيير الي العربية', Icons.language,true),
            SizedBox(
              height: kPadding,
            ),
            newListTile('Account Settings', Icons.settings,true),
            SizedBox(
              height: kPadding,
            ),
            newListTile('How to Use', Icons.mouse,true),
            newDivider(),
            newListTile('Send to Friends', Icons.send,true),
            newDivider(),
            newListTile('Recommend a Store', Icons.favorite,true),
            SizedBox(
              height: kPadding,
            ),
            newListTile('Account Settings', Icons.settings,true),
            SizedBox(
              height: kPadding,
            ),
           newListTile('Kermalk Support', Icons.support, true),
            // ListTile(
            //   title: Text(
            //     'Kermalk Support',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   leading: KoukiconsAssistant(height: 40,),
            //   tileColor: Colors.white,
            //   trailing: Icon(Icons.arrow_forward_ios),
            // ),
            newDivider(),
            newListTile('Terms of Services', Icons.branding_watermark_sharp,true),
            newDivider(),
            newListTile('Privacy Policy', Icons.privacy_tip,true),
            SizedBox(
              height: kPadding,
            ),
            newListTile('Log Out', Icons.exit_to_app, false),
            SizedBox(
              height: kPadding,
            ),
          ],
        ),
      ),
    );
  }
Widget newDivider(){
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child:Container(
            width: double.infinity,
            height: 1,
            color:Colors.grey[500]
        )
    );
}
  Widget newListTile(String title, IconData icon1, bool isVisible) {
    return ListTile(

      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(icon1, color: Colors.deepOrange,),
      tileColor: Colors.white,
      trailing: Visibility(
          visible: isVisible,
          child: Icon(Icons.arrow_forward_ios)),
    );
  }
}
