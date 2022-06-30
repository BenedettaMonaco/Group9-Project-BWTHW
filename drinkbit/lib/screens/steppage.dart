import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:drinkbit/screens/homepage.dart';
import 'package:drinkbit/screens/distancepage.dart';
import 'package:drinkbit/database/database.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:drinkbit/database/daos/datadao.dart';
import 'package:drinkbit/database/entities/entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:drinkbit/screens/fetchpage.dart';

class StepPage extends StatelessWidget {
  StepPage({Key? key}) : super(key: key);

static const routeDisplayName = 'steppage';

  final _tooltipBehavior = TooltipBehavior(enable: true);

  final _tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    ChartSeriesController? _chartSeriesController1;
    return Scaffold(
        appBar: AppBar(title: Text('Step Page'),
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
              future: dbr.findAllStepss(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Steps>;
                  /* final datadistance = snapshot.data as List<Distance>;*/

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 550,
                          width: 400,
                          child: SfCartesianChart(
                            title: ChartTitle(text: 'Steps'),
                            legend: Legend(isVisible: true),

                            series: <ChartSeries>[
                              LineSeries<Steps, DateTime>(
                                name: 'Steps',
                                animationDuration: 4000,
                                animationDelay: 1000,
                                onRendererCreated:
                                    (ChartSeriesController controller) {
                                  _chartSeriesController1 = controller;
                                },
                                dataSource: data,
                                xValueMapper: (Steps steps, _) => steps.day,
                                yValueMapper: (Steps steps, _) => steps.steps,
                                /* borderRadius:
                                    BorderRadius.all(Radius.circular(15)),*/
                                color: Color.fromARGB(255, 240, 91, 185),
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
                              labelFormat: ''
                              /* numberFormat: NumberFormat.simpleCurrency(
                                    decimalDigits: 3) */
                            ),
                               tooltipBehavior: _tooltipBehavior,
                          )),

                      Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                            RaisedButton(
                              color: Color.fromARGB(255, 4, 242, 198),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(66, 237, 86, 169),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 10,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {
                                _chartSeriesController1?.animate();
                              },
                              child: Text('Column'),
                            )
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

List<StepsData> findAllStepss() {
  final List<StepsData> chartData = [];
  return chartData;
}

class StepsData {
  StepsData(this.day, this.steps);
  final double day;
  final double steps;
}