import 'package:flutter/material.dart';
import 'package:drinkbit/screens/homePage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const _PATH = "assets/images";
const _drink = "$_PATH/cocktails.jpg";

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Group 9'),
          centerTitle: true,
        ), //AppBar
        body: Center(
          /* Card Widget */
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.cyanAccent[100], 
            child: SizedBox(
              width: 300,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Image.asset(_drink),
                  const SizedBox(
                    height: 10,
                  ), //SizedBox

                  const SizedBox(
                    height: 10,
                  ), //SizedBox
                  const Text(
                    "This is an app for fun! It will tell you if you deserve a drink or not based on how much calories you have consumed. Moreover it has graphs of the last three months' distances and steps. Enjoy!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20),
                  ), //Textstyle
                  //Text
                  //SizedBox
                  FloatingActionButton(
                    elevation: 0,
                    child: Icon(Icons.favorite_border),
                    backgroundColor: Colors.pinkAccent,

                    onPressed: () {},
                  ),
                ]),
                
              ), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ), //Center
    ); //Scaffold
    //MaterialApp
  }
}


  