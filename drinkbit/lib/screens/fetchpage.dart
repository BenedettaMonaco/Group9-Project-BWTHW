import 'package:drinkbit/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:drinkbit/database/entities/entity.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:drinkbit/screens/homepage.dart';
import 'package:floor/floor.dart';
import 'package:fitbitter/fitbitter.dart';

import 'package:drinkbit/utils/strings.dart';
import 'package:provider/provider.dart';

class FetchPage extends StatelessWidget {
  FetchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
    constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/lemon.jpg"), fit: BoxFit.cover)),
    child: Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('Fetchpage'),
          actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home/');
            },
            icon: Icon(Icons.arrow_right_alt_sharp),
          ),
        ],
          
         ), 
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'calories',
                );
                //Fetch data
                final caloriesData =
                    await fitbitActivityTimeseriesDataManager.fetch(
                        FitbitActivityTimeseriesAPIURL.threeMonthsWithResource(
                  baseDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
                // Use them as you want
                print(caloriesData);
                for (var i = 0; i < caloriesData.length - 1; i++) {
                  DateTime? data = caloriesData.elementAt(i).dateOfMonitoring;
                  double? calorie = caloriesData.elementAt(i).value;
                  print(Calories(data!, calorie!).calories.toString());
                  print(Calories(data, calorie).day.toString());
                  await Provider.of<DatabaseRepository>(context, listen: false)
                      .insertCalories(Calories(data, calorie));
                }
               
              },
              child: Text('Fetch calories data'),
            ),
            ElevatedButton(
              child: Text('Fetch distance data'),
              onPressed: () async {
              // Navigator.pushNamed(context, 'distance');
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                  type: 'distance',
                );
                //Fetch data
                final DistanceData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.threeMonthsWithResource(
                  baseDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;
                // Use them as you want
                print(DistanceData);
                for (var i = 0; i < DistanceData.length - 1; i++) {
                  DateTime? data = DistanceData.elementAt(i).dateOfMonitoring;
                  double? distanza = DistanceData.elementAt(i).value;
                  print(Distance(data!, distanza!).distance.toString());
                  print(Distance(data, distanza).day.toString());
                  await Provider.of<DatabaseRepository>(context, listen: false)
                      .insertDistance(Distance(data, distanza));
                }
              },
            ),
             ElevatedButton(
                child: Text('Fetch steps data'),
                onPressed: () async {

                  //Instantiate a proper data manager
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    type: 'steps',
                  );
                  //Fetch data
                  final stepsData =
                       await fitbitActivityTimeseriesDataManager.fetch(
                          FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                    startDate:
                        DateTime.now().subtract(const Duration(days: 100)),
                    endDate: DateTime.now(),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;

                  // Use them as you want

                  print(stepsData);
                  for (var i = 0; i < stepsData.length - 1; i++) {
                    DateTime? data = stepsData.elementAt(i).dateOfMonitoring;
                    double? passi = stepsData.elementAt(i).value;

                    print(Steps(data!,passi!,).steps.toString());
                    print(Steps(data, passi).day.toString());
                    await Provider.of<DatabaseRepository>(context,
                            listen: false)
                        .insertSteps(Steps(data, passi));
                  }
                }
            ),
            
            ],
        ))));
  }
}
