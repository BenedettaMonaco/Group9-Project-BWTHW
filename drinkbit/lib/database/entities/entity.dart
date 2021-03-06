import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:drinkbit/database/typeConverters/dateTimeConverter.dart';


@entity
class Calories {
 @PrimaryKey()
 
  final DateTime day;
  final double calories;
  //Default constructor
  Calories(this.day, this.calories);

}
@entity
class Drink {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
@PrimaryKey()
  

  final String ingredients;
  final double cal;
  final String name;


  //Default constructor
  Drink(this.name, this.cal,this.ingredients);
  
}
@entity
class Distance {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey()

  final DateTime day;
  final double distance;
  //Default constructor
  Distance(this.day, this.distance);
}

@entity
class Steps {
  @PrimaryKey()

  final DateTime day;
  final double steps;

  //Default constructor
  Steps(this.day, this.steps);

}