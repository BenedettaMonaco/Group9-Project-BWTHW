import 'package:drinkbit/database/database.dart';
import 'package:drinkbit/database/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';


class DatabaseRepository extends ChangeNotifier{

  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

 //This method wraps the findAllCaloriess() method of the DAO
   Future<List<Calories>> findAllCaloriess() async{
    final results = await database.Calories.findAllCaloriess();
    return results;
    } 
  
  //This method wraps the insertCalories() method of the DAO. 
  //Then, it notifies the listeners that something changed.

  Future<void> insertCalories(Calories calories) async {
    await database.Calories.insertCalories(calories);
    notifyListeners();
  }
  //This method wraps the deleteCalories() method of the DAO. 
  //Then, it notifies the listeners that something changed.

  Future<void> removeCalories(Calories calories) async{
    await database.Calories.deleteCalories(calories);
    notifyListeners();
  }

  Future<List<Drink>> findAllDrinks() async{
    final results = await database.drinkDao.findAllDrinks();
    return results;
  }
  Future<void> insertDrink(Drink drink)async {
    await database.drinkDao.insertDrink(drink);
    notifyListeners();
  }
  Future<void> removeDrink(Drink drink) async{
    await database.drinkDao.deleteDrink(drink);
    notifyListeners();
  }
  Future<void> updateDrink(Drink drink) async{
    await database.drinkDao.updateDrink(drink);
    notifyListeners();
  }

  Future<List<Distance>> findAllDistances() async {
    final results = await database.Distance.findAllDistances();
    return results;
  }
  Future<void> insertDistance(Distance distance) async {
    await database.Distance.insertDistance(distance);
    notifyListeners();
  } 
  Future<void> removeDistance(Distance distance) async {
    await database.Distance.deleteDistance(distance);
    notifyListeners();
  }

  Future<List<Steps>> findAllStepss() async {
    final results = await database.Steps.findAllStepss();
    return results;
  }
  Future<void> insertSteps(Steps steps) async {
    await database.Steps.insertSteps(steps);
    notifyListeners();
  } 
  Future<void> removeSteps(Steps steps) async {
    await database.Steps.deleteSteps(steps);
    notifyListeners();
  } 
}//DatabaseRepository