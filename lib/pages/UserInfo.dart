import 'package:flutter/material.dart';
import 'package:pillwhen/models/User.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/peopleItem.dart';
import 'package:table_calendar/table_calendar.dart';

enum CalendarStatus {
  NORMAL,
  TODAY,
  SELECTED
}

class UserInfo extends StatefulWidget {
  final String name;

  UserInfo({Key key, this.name}) : super(key: key);
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  DateTime _selectedDay;
  DateTime _month;

  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;

  User dummy = dummyUser();

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
    for(var history in dummy.pillHistories) {
      print(removeHMS(history.date));
      _events[removeHMS(history.date)] = [history];
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
    var profile = <Widget>[];
    var calender = <Widget>[];

    List<String> eat = [];

    eat.add(dummy.pillHistories[0].morningStatus ? "먹음".toString() : "안먹음".toString() );
    eat.add(dummy.pillHistories[0].lunchStatus ? "먹음".toString() : "안먹음".toString() );
    eat.add(dummy.pillHistories[0].dinnerStatus ? "먹음".toString() : "안먹음".toString() );

    profile.add(PwCard(onTap:(){}, child: PeopleItem(image:Image.network(dummy.profileImageUri).image, name:dummy.name,desc:'아침 : ${eat[0]} \n점심 : ${eat[1]} \n저녁 : ${eat[2]}',)));
    profile.add(Padding(padding:EdgeInsets.only(top: 10.0)));

    calender.add(_buildTableCalendar(context));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
              child:Text('${widget.name}씨의 정보', style: Theme.of(context).textTheme.title),

            ),
            Padding(
              padding:EdgeInsets.only(top:25.0, bottom:25.0),
              child:Text("${widget.name}씨가 즐겨찾기 중인 사람들", style:Theme.of(context).textTheme.body1)
            ),
            Column(
              children: profile,
            ),
            Padding(
              padding:EdgeInsets.only(top:25.0, bottom:25.0),
              child:Text("${widget.name}씨의 약일정", style:Theme.of(context).textTheme.body1)
            ),
            Padding(
              padding:EdgeInsets.only(top:0.0, bottom:0.0),
              child: _buildTableCalendar(context)
            ),
            _buildEventList(),
          ],
        ),
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
//        return Container(
//          child: Text('✓', style: Theme.of(context).textTheme.body1.copyWith(color: markerColor),),
//        );

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
        child: Text(pillInfo.remainingPills.toString()),
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
