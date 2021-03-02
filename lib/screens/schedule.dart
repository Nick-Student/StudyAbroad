// Scheduler
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

@override
void initState() {
  super.initState();
  _calendarController = CalaendarController();
}

@override
void dispose() {
  _calendarController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return TableCalendar(calendarController: _calendarcontroller,)
}

