
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drinkbit/utils/formats.dart';
import 'dart:ffi';
import 'package:drinkbit/database/entities/entity.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:drinkbit/screens/homepage.dart';
import 'package:floor/floor.dart';
import 'package:provider/provider.dart';

class CaloriesPage extends StatelessWidget {
  CaloriesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calories Page'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home/');
              },
              icon: Icon(Icons.arrow_right_alt_sharp),),
          ],
        ),
        body: Center(
          child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
            //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
            //and then populate the ListView accordingly.
            //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
            return FutureBuilder(
              initialData: null,
              future: dbr.findAllCaloriess(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final datacal = snapshot.data as List<Calories>;
                  //If the Meal table is empty, show a simple Text, otherwise show the list of meals using a ListView.
                  return datacal.length == 0
                      ? Text('')
                      : ListView.builder(
                          itemCount: datacal.length,
                          itemBuilder: (context, calIndex) {
                            final remove = datacal[calIndex];
                            //Here, we are using a Card to show a Meal
                            return Card(
                              elevation: 5,
                              child: Dismissible(
                                //Just create a dummy unique key
                                key: UniqueKey(),
                                //This is the background to show when the ListTile is swiped
                                background: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                                child: ListTile(
                                tileColor: Colors.black,
                                  title: Text(
                                      'Day : ${Formats.onlyDayDateFormat.format(datacal[calIndex].day)}'),
                                  subtitle: Text(
                                      'Calories : ${datacal[calIndex].calories}'),
                                  onTap: () {
                                    if (datacal[calIndex].calories > 3000) {
                                      Navigator.pushNamed(context, 'cocktail');
                                      final snackBar = SnackBar(
                                        duration: const Duration(seconds: 7),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                        elevation: 20,
                                        behavior: SnackBarBehavior.floating,                                      
                                        padding: EdgeInsets.all(20.0),
                                        margin: EdgeInsets.all(50.0),
                                          content: 
                                          Text(
                                              'You burned ${datacal[calIndex].calories} calories! Check these drinks'));
                                          
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar); //},
                                    }
                                    
                                    else{ final snackBar = SnackBar(
                                        duration: const Duration(seconds: 7),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                        elevation: 20,
                                        behavior: SnackBarBehavior.floating,                                      
                                        padding: EdgeInsets.all(20.0),
                                        margin: EdgeInsets.all(50.0),
                                          content: 
                                          Text(
                                              'You did not consumed enough!'));  
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);

                                    }
                                  }),
                                 onDismissed: (direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    await Provider.of<DatabaseRepository>(context,listen: false)
                                            .removeCalories(remove);
                                    print("Deleted");
                                  }},
                                  ),
                                 
                                
                            );
                          
                          });
                } 
                          else { return CircularProgressIndicator();}
                  
              },
            );
          }),
        ));
  }
  
  

}
