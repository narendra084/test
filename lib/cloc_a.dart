import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockTask extends StatefulWidget {
  @override
  _ClockTaskState createState() => _ClockTaskState();
}

class _ClockTaskState extends State<ClockTask> {
  String _timeString;
  var current;
  String _mmmedString;
  String _usaTime;
  String _londonTime;
  String _germanyTime;

  void _getIndianTime() {
    current = DateTime.now();
    final String formattedDateTime =
    DateFormat('h:mm a').format(DateTime.now()).toString();
    final String mmmed = DateFormat('MMMEd').format(DateTime.now()).toString();

    DateTime usaformatedDate = current.subtract(Duration(hours: 10, minutes: 30, seconds: 00, milliseconds: 00, microseconds: 00));
    final String usaTime = DateFormat('h:mm a').format(usaformatedDate).toString();

    DateTime londonformatedDate = current.subtract(Duration(hours: 5, minutes: 30, seconds: 00, milliseconds: 00, microseconds: 00));
    final String londonTime = DateFormat('h:mm a').format(londonformatedDate).toString();

    DateTime germanyformatedDate = current.subtract(Duration(hours: 4, minutes: 30, seconds: 00, milliseconds: 00, microseconds: 00));
    final String germanyTime = DateFormat('h:mm a').format(germanyformatedDate).toString();

    setState(() {
      _timeString = formattedDateTime;
      _mmmedString = mmmed;
      _usaTime = usaTime;
      _londonTime = londonTime;
      _germanyTime = germanyTime;
    });
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getIndianTime());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Clock",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _timeString.toString(),
                    style: TextStyle(color: Colors.blue, fontSize: 50),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${_mmmedString.toString()}, ",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Icon(
                    Icons.alarm,
                    color: Colors.white70,
                  ),
                  Text(
                    "Mon,",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    "8:00,",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    "am,",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "London",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          "5 hr 30 min behind",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${_londonTime.toString()}",
                      style: TextStyle(color: Colors.white70, fontSize: 35),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "New York",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          "10 hr 30 min behind",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${_usaTime.toString()}",
                      style: TextStyle(color: Colors.white70, fontSize: 35),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Germany",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          "4 hr 30 min behind",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${_germanyTime.toString()}",
                      style: TextStyle(color: Colors.white70, fontSize: 35),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}