import 'package:flutter/material.dart';
import 'package:drinkbit/screens/loginPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drinkbit/infoutente/userdata.dart';
import 'package:drinkbit/infoutente/useraccount.dart';
import 'package:drinkbit/infoutente/info.dart';

const _PATH = "assets/images";
const _FOTO = "$_PATH/lemon.jpg";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'User Profile';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(HomePage.routename),
         backgroundColor: Colors.black,
         shadowColor: Colors.black,
         ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
               margin: EdgeInsets.only(bottom: 15),
              child: Image.asset(
                _FOTO,
                height: 600,
                width: 600,),  ), 
            BottomAppBar(
                color: Colors.black,
                child: Row(children: [
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'useraccount');
                      }),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'userdata');
                      }),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'info');
                      }),
                      Spacer(),
                  IconButton(
                      icon: Icon(
                        MdiIcons.clock,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'clock');
                      }),
                ])),
            
          ],
        )),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            child: Text('DRINKBIT'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => _toLoginPage(context),
            shape:
                StadiumBorder(side: BorderSide(color: Colors.cyan, width: 1.0)),
          ),
          
          ListTile(
            leading: Icon(Icons.food_bank_outlined),
            title: Text('Calorie'),
            onTap: () => _toCaloriesPage(context),
            shape:
                StadiumBorder(side: BorderSide(color: Colors.cyan, width: 1.0)),
          ),
          ListTile(
            leading: Icon(Icons.dialpad_outlined),
            title: Text('Fetchpage'),
            onTap: () => _toFetchPage(context),
            shape:
                StadiumBorder(side: BorderSide(color: Colors.cyan, width: 1.0)),
          ),
          ListTile(
            leading: Icon(MdiIcons.glassCocktail),
            title: Text('Cocktails'),
            onTap: () => _toCocktailPage(context),
            shape:
                StadiumBorder(side: BorderSide(color: Colors.cyan, width: 1.0)),
          ),
          ListTile(
            leading: Icon(MdiIcons.graph),
            title: Text('Distances'),
            onTap: () => _toDistancePage(context),
            shape:
                StadiumBorder(side: BorderSide(color: Colors.cyan, width: 1.0)),
          ),
          ListTile(
            leading: Icon(MdiIcons.walk),
            title: Text('Steps'),
            onTap: () => _toStepPage(context),
            shape:
                StadiumBorder(side: BorderSide(color: Colors.cyan, width: 1.0)),
          ),
        ]))
          
      
        );
  } //build

  void _toLoginPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  } //_toCalendarPage

  void _toCaloriesPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('calories');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed('calories');
  } //_

  void _toFetchPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('fetchpage');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed('fetchpage');
  } //_

  void _toCocktailPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('cocktail');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed('cocktail');
  } //_

  void _toDistancePage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('distance');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed('distance');
  } //_
  void _toStepPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('steppage');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed('steppage');
  } //_
} //HomePage
