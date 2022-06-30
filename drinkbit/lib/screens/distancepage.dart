import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:drinkbit/screens/homepage.dart';
import 'package:drinkbit/screens/fetchpage.dart';
import 'package:drinkbit/database/database.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:drinkbit/database/daos/datadao.dart';
import 'package:drinkbit/database/entities/entity.dart';

class DistancePage extends StatelessWidget { 

  DistancePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routeDisplayName = 'Distancepage';


  final _tooltipBehavior = TooltipBehavior(enable: true);

  final _tooltip = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    ChartSeriesController? _chartSeriesController1;
    return Scaffold(
        appBar: AppBar(title: Text('Distance Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home/');
            },
            icon: Icon(Icons.arrow_right_alt_sharp),
          ),
        ],),
        body: Center(
            child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
          return FutureBuilder(
              initialData: null,
              future: dbr.findAllDistances(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Distance>;                
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 550,
                          width: 400,
                          child: SfCartesianChart(
                            title: ChartTitle(text: 'Distance'),
                            legend: Legend(isVisible: true),

                            /*tooltipBehavior: _tooltipBehavior,*/

                            series: <ChartSeries>[
                              ColumnSeries<Distance, DateTime>(
                                name: 'Distance',
                                animationDuration: 4000,
                                animationDelay: 1000,
                                onRendererCreated:
                                    (ChartSeriesController controller) {
                                  _chartSeriesController1 = controller;
                                },
                                dataSource: data,
                                xValueMapper: (Distance distance, _) =>
                                    distance.day,
                                yValueMapper: (Distance distance, _) =>
                                    distance.distance,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Color.fromARGB(255, 233, 222, 8),
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false),
                                enableTooltip: true,
                                opacity: 1,
                              ),
                            
                            ],
                            primaryXAxis: DateTimeAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              enableAutoIntervalOnZooming: true,
                            ),
                            primaryYAxis: NumericAxis(
                                majorGridLines: MajorGridLines(width: 0),
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                                
                            ),
                            tooltipBehavior: _tooltipBehavior,
                          )),
                      Container(
                          child: Column(
                              /*mainAxisAlignment: MainAxisAlignment.center,*/
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              /*crossAxisAlignment: CrossAxisAlignment.end,*/

                              children: [
                            RaisedButton(
                              color: Color.fromARGB(255, 4, 242, 198),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black26, width: 4),
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 10,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {
                                _chartSeriesController1?.animate();
                              },
                              child: Text('Column'),
                            ),
                          ]))
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              });
        })));
  }
  
}


List<DistanceData> findAllDistances() {
  final List<DistanceData> chartData = [];
  return chartData;
}


class DistanceData {
  DistanceData(this.day, this.distance);
  final double day;
  final double distance;
}