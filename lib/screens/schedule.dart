// Scheduler
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Scheduler extends StatefulWidget {
  @override
  _SchedulerState createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calendar'),
      ),
      body: Stack(children: <Widget>[
        TableCalendar(calendarController: _controller)
        ],
      ),
    );
  }
}

