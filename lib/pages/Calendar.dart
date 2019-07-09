import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
 
    );
  }
}
