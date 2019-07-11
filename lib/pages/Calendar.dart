import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pillwhen/models/User.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:table_calendar/table_calendar.dart';

enum CalendarStatus {
  NORMAL,
  TODAY,
  SELECTED
}

class Calendar extends StatefulWidget {

  final List<PillHistory> pillHistories;

  const Calendar({Key key, this.pillHistories}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  DateTime _selectedDay;
  DateTime _month;

  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = removeHMS(DateTime.now());
    _month = _selectedDay;

    initEvents();
    _selectedEvents = _events[_selectedDay] ?? []; //if (==null) 후자를 반환
    _visibleEvents = _events;
  }

  void initEvents() {
    _events = {};
    for(var history in widget.pillHistories) {
      print(removeHMS(history.time));
      _events[removeHMS(history.time)] = [history];
    }
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _month = first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0).copyWith(bottom: 0.0),
            child: Text('${_month.year % 100}년 ${_month.month}월 캘린더', style: Theme.of(context).textTheme.title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(bottom: 8.0),
            child: _buildTableCalendar(context),
          ),
          _buildEventList(),
        ],
      ),
    );
  }

  Widget _buildTableCalendar(context) {
    return TableCalendar(
      locale: 'en_US', //변경 금지
      events: _visibleEvents,
      formatAnimation: FormatAnimation.scale,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.horizontalSwipe,
      headerVisible: false,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.red,
        todayColor: Color.fromARGB(200, 254, 154, 46),
        markersColor: Colors.red,
        markersPositionTop: 25.0,
        markersPositionLeft: 30.0,
        markersMaxAmount: 1,
        outsideDaysVisible: false
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      builders: CalendarBuilders(
        dayBuilder: (ctx, date, events) {
          return _createDayWidget(context, ctx, date, events, CalendarStatus.NORMAL);
        },
        todayDayBuilder: (ctx, date, events) {
          return _createDayWidget(context, ctx, date, events, CalendarStatus.TODAY);
        },
        selectedDayBuilder: (ctx, date, events) {
          return _createDayWidget(context, ctx, date, events, CalendarStatus.SELECTED);
        },
        singleMarkerBuilder: (dynamic ctx, date, events) {
          var markerColor = ctx.widget.calendarStyle.markersColor;
          if (checkToday(date, _selectedDay) || checkToday(date, DateTime.now())) {
            markerColor = Colors.white;
          }
//          return Container(
//            child: Text('✓', style: Theme.of(context).textTheme.body1.copyWith(color: markerColor),),
//          );

          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 0.3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: markerColor,
            ),
          );
        }
      ),
    );
  }

  Widget _createDayWidget(applicationContext, ctx, date, events, status) {
    var textStyle = Theme.of(applicationContext).textTheme.body1.copyWith(fontSize: 12.0);
    if (status != CalendarStatus.NORMAL) textStyle = textStyle.copyWith(color: Colors.white);

    var backgroundColor = Theme.of(applicationContext).cardColor;
    if (status == CalendarStatus.SELECTED) backgroundColor = ctx.widget.calendarStyle.selectedColor;
    if (status == CalendarStatus.TODAY) backgroundColor = ctx.widget.calendarStyle.todayColor;

    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(color: Theme.of(applicationContext).primaryColorDark, blurRadius: 15.0, offset: Offset(0.0, 8.0))
                ],
                color: backgroundColor
            ),
            child: Text(date.day.toString(), style: textStyle,)
        )
    );
  }

//하단 리스트 뷰
  Widget _buildEventList() {
    if (_selectedEvents.length == 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Center(child: Text('기록이 없어요!')),
      );
    }

    var history = _selectedEvents[0];
    var createCard = (pillInfo) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(
          bottom: 10.0),
      child: PwCard(
        child: Text(pillInfo.remainEat.toString()),
      ),
    );

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          createCard(history.morning),
          createCard(history.lunch),
          createCard(history.dinner),
        ]
    );
  }
}


bool checkToday(DateTime firstDate, DateTime secondDate) {
  return firstDate.year == secondDate.year
      && firstDate.month == secondDate.month
      && firstDate.day == secondDate.day;
}

DateTime removeHMS(DateTime date) {
  return date.subtract(
    Duration(
      hours: date.hour,
      minutes: date.minute,
      seconds: date.second,
      milliseconds: date.millisecond,
      microseconds: date.microsecond,
    )
  );
}