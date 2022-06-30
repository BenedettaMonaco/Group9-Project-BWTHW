
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:drinkbit/database/entities/entity.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:drinkbit/screens/drinkpage.dart';
import 'package:provider/provider.dart';


class CocktailPage extends StatelessWidget {
 CocktailPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routeDisplayName = 'Cocktail';

  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    
    return Scaffold(
      appBar: AppBar(
        title: Text(CocktailPage.routeDisplayName),
      actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home/');
            },
            icon: Icon(Icons.arrow_right_alt_sharp),
          ),
        ],),
      body: Center(
        child: Consumer<DatabaseRepository>(
          builder: (context, dbr, child) {
            return FutureBuilder(
              initialData: null,
              future: dbr.findAllDrinks(),
              builder:(context, snapshot) {
                if(snapshot.hasData){
                  final data = snapshot.data as List<Drink>;
                  return data.length == 0 ? Text('The drink list is currently empty') : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, drinkIndex) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(MdiIcons.glassCocktail),
                          trailing: Icon(MdiIcons.noteEdit),
                          title:
                          Text(' ${data[drinkIndex].name} ''${data[drinkIndex].cal} [Kcal] '),
                          subtitle: Text('${data[drinkIndex].ingredients} '),
                          onTap: () => _toDrinkPage(context, data[drinkIndex]),
                        ),
                      );
                    });
                }//if
                else{
                  return CircularProgressIndicator();
                }//else
              },//FutureBuilder builder 
            );
          }//Consumer-builder
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () => _toDrinkPage(context, null),
      ),
    );
  } //build

  //Utility method to navigate 
  void _toDrinkPage(BuildContext context, Drink? drink) {
    Navigator.pushNamed(context, DrinkPage.route, arguments: {'drink': drink});
  } //
} //HomePage