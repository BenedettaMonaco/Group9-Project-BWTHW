import 'package:drinkbit/database/entities/entity.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class CaloriesDao {

  //Query #1: SELECT -> this allows to obtain all the entries of the table
  @Query('SELECT * FROM Calories')
  Future<List<Calories>> findAllCaloriess();

  //Query #2: INSERT -> this allows to add in the table
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCalories(Calories calories);

  //Query #3: DELETE -> this allows to delete  from the table
  @delete
  Future<void> deleteCalories(Calories calories);
} 

@dao
abstract class DrinkDao {

  @Query('SELECT * FROM Drink')
  Future<List<Drink>> findAllDrinks();

  @insert
  Future<void> insertDrink(Drink drink);

  @delete
  Future<void> deleteDrink(Drink task);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateDrink(Drink drink);
  
}

@dao
abstract class DistanceDao {
  @Query('SELECT * FROM Distance')
  Future<List<Distance>> findAllDistances();

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertDistance(Distance distance);

  @delete
  Future<void> deleteDistance(Distance distance);
}

@dao
abstract class StepsDao {
  @Query('SELECT * FROM Steps')
  Future<List<Steps>> findAllStepss();

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertSteps(Steps steps);

  @delete
  Future<void> deleteSteps(Steps steps);
} 


