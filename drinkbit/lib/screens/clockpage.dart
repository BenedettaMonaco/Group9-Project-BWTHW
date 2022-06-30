
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:swipe/swipe.dart';


void runDemo() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp( SwipePage());
}

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swipe(
        child: Container( decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.cyan, Colors.black])),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                simpleClock, ],)),

        ),
        onSwipeUp: () {
          setState(() { Navigator.pushNamed(context, '/home/');
            
          });
        },
        onSwipeDown: () {
          setState(() { Navigator.pushNamed(context, 'info');
            
          });
        
        
        },
        onSwipeLeft: () {
          setState(() { Navigator.pushNamed(context, 'useraccount');
            
          });},

         onSwipeRight: () {
          setState(() { Navigator.pushNamed(context, 'userdata');
            
          });}
          ),);
        
      
    
  }
   Widget get simpleClock => AnalogClock(
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.white),
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        width: 300.0,
        isLive: true,
        hourHandColor: Colors.yellow,
        minuteHandColor: Colors.yellow,
        showSecondHand: true,
        numberColor: Colors.white,
        showNumbers: true,
        textScaleFactor: 1.4,
        
        showTicks: true,
        showDigitalClock: true,
        digitalClockColor: Colors.white,
        datetime: DateTime.now(),
        key: const GlobalObjectKey(3),
      );
}