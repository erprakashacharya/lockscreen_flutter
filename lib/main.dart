import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prkash Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              Text(
                "Menu",
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[],
          ),
        ),
        body: PrakashDashboard(),
      ),
    );
  }
}

class PrakashDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://www.itl.cat/pngfile/big/212-2125770_best-52-android-material-wallpaper-4k-android.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(),
          Container(
            height: 40,
          ),
          Icon(
            Icons.lock,
            color: Colors.white,
          ),
          Container(height: 200),
          AnalogClock(
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.transparent),
                color: Colors.transparent,
                shape: BoxShape.circle),
            width: 150.0,
            height: 150.0,
            isLive: true,
            hourHandColor: Colors.transparent,
            minuteHandColor: Colors.transparent,
            secondHandColor: Colors.transparent,
            numberColor: Colors.transparent,
            showNumbers: true,
            textScaleFactor: 4,
            showTicks: false,
            digitalClockColor: Colors.white,
            showDigitalClock: true,
          ),
          Text(
            "${getWeekday(today.weekday)}  ,  ${today.day}  ${getMonth(today.month)}",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(height: 200,),
          Footer()
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child: Text("@Copyright"),
        ),
      ],
    );
  }
}

String getMonth(int month) {
  if (month == 1) return "Jan";
  if (month == 2) return "Feb";
  if (month == 3) return "Mar";
  if (month == 4) return "Apr";
  if (month == 5) return "May";
  if (month == 6) return "Jun";
  if (month == 7) return "Jul";
  if (month == 8) return "Aug";
  if (month == 9) return "Sep";
  if (month == 10) return "Oct";
  if (month == 11) return "Nov";
  if (month == 12) return "Dec";
  return "invalid";
}

String getWeekday(int weekday) {
  print("weekday $weekday");
  if (weekday == 1) return "Mon";
  if (weekday == 2) return "Tue";
  if (weekday == 3) return "Wed";
  if (weekday == 4) return "Thu";
  if (weekday == 5) return "Fri";
  if (weekday == 6) return "Sat";
  if (weekday == 7) return "Sun";
  return "invalid";
}
