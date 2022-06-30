import 'package:drinkbit/utils/formSeparator.dart';
import 'package:drinkbit/utils/formTiles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:drinkbit/screens/homePage.dart';

class DatiUtente extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      brightness: Brightness.dark),
      home: Scaffold(
appBar: AppBar(title:Text('User Info'),),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
body: Container(
   child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormSeparator(label: ''),
            FormTextTile(
              labelText: 'GENDER : Female',
              icon: Icons.woman,
            ),
            FormSeparator(label: ''),
            FormTextTile(
              labelText: 'NAME : Debora Rossi',
            ),
            FormSeparator(label: ''),
            FormTextTile(labelText: 'HEIGHT: 165 cm'),
            FormSeparator(label: ''),
            FormTextTile(labelText: 'DATE OF BIRTH :19 December 1994'),
            FormSeparator(label: ''),
            FormTextTile(labelText: 'WEIGHT : 60 Kg'),
          ],)))));
  }
}
