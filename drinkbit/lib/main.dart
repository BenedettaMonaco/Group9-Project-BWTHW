import 'package:drinkbit/infoutente/useraccount.dart';
import 'package:drinkbit/infoutente/info.dart';
import 'package:drinkbit/screens/caloriespage.dart';
import 'package:drinkbit/screens/clockpage.dart';
import 'package:drinkbit/screens/cocktailpage.dart';
import 'package:drinkbit/screens/distancepage.dart';
import 'package:drinkbit/screens/drinkpage.dart';
import 'package:drinkbit/screens/fetchpage.dart';
import 'package:drinkbit/screens/steppage.dart';
import 'package:flutter/material.dart';
import 'package:drinkbit/screens/homePage.dart';
import 'package:drinkbit/screens/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drinkbit/infoutente/userdata.dart';
import 'package:drinkbit/infoutente/useraccount.dart';
import 'package:drinkbit/infoutente/info.dart';
import 'package:drinkbit/database/database.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter_launcher_icons/android.dart';

Future<void> main() async {
  //This is a special method that use WidgetFlutterBinding to interact with the Flutter engine.
  //This is needed when you need to interact with the native core of the app.
  //Here, we need it since when need to initialize the DB before running the app.
  WidgetsFlutterBinding.ensureInitialized();
  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);

  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      
      theme: ThemeData(
        fontFamily: 'JosefinSans-Bold',

        primarySwatch: Colors.cyan,
        brightness: Brightness.dark,
      ),
      
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        HomePage.route: (context) => HomePage(),
        'userdata': (context) => DatiUtente(),
        'info': (context) => InfoPage(),
        'useraccount': (context) => AccountPage(),
        'calories': (context) => CaloriesPage(),
        'fetchpage': (context) => FetchPage(),
        'cocktail': (context) => CocktailPage(),
        'distance':(context) => DistancePage(),
        'clock': (context) => SwipePage(),
        'steppage':(context) => StepPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.route) {
          return MaterialPageRoute(builder: (context) {
            return HomePage();
          });
        } else if (settings.name == DrinkPage.route) {
          final args = settings.arguments as Map;
          return MaterialPageRoute(builder: (context) {
            //Compared to exercise 07.01, I'm passing only the Meal object. We will get access to the DB via
            //the provided DatabaseRepository and we will get the id of the meal from the Meal entry itself.
            return DrinkPage(drink: args['drink']);
          });
        } else {
          return null;
        } //if-else
      }, //onGenera
    );
  } //build
} //MyApp



  @override
  Widget build(BuildContext context) => const MaterialApp(
          home: Scaffold(
        body: AnalogClock(),
      ));
