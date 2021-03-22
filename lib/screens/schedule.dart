// Scheduler
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class Scheduler extends StatefulWidget {
  @override
  _SchedulerState createState() => _SchedulerState();
}
//Connecting screen to scheduler button
class _SchedulerState extends State<Scheduler> {
  //Map<DateTime, List> _events;
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    //_events = {};
  }
  @override //Creation of calendar
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //events: _events,
              headerStyle: HeaderStyle(
                centerHeaderTitle: true, //Centering the calendar title
              ),
              calendarController: _controller,)
          ]
        )
      ),
    );
  }
}

