import 'package:flutter/material.dart';
import 'package:drinkbit/screens/homePage.dart';
import 'package:drinkbit/utils/formSeparator.dart';
import 'package:drinkbit/utils/formTiles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const _PATH = "assets/images";
const _GIF = "$_PATH/pc.gif";

class AccountPage extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      brightness: Brightness.dark),
      home: Scaffold(
appBar: AppBar(title:Text('User Account'),),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
body: Container(
   child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormSeparator(label: '',),
            FormTextTile(
              labelText: 'Email address: deborar@gmail.com',
              icon: Icons.alternate_email,
            ),
            FormSeparator(label: ''),
            FormTextTile(
              labelText: 'Password: debby',
              icon: Icons.key,
            ),
             FormSeparator(label: ''),
             Container(
               margin: EdgeInsets.only(bottom: 15),
              child: Image.asset(
                _GIF,
                height: 400,
                width: 400,),  ), 
          ],)))));
  }
}
 