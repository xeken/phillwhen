import 'package:flutter/material.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 1)): [
        '아침         ○',
        '점심         ×',
        '저녁         ○'
      ], // 어제
      _selectedDay: ['아침         ○', '점심         ○', '저녁         마다마다'], // 오늘 , 해상도 테스트는 안 해봤다만 마커표사는 한 날에 최대 4개인 것으로 판단
      _selectedDay.add(Duration(days: 1)):
          Set.from(['아침         마다마다', '점심         마다마다', '저녁         마다마다']).toList(), //중복제거 방식
      _selectedDay.add(Duration(days: 2)): ['쾌유빔'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildTableCalendar(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'en_US',
      //변경 금지
      events: _visibleEvents,
      formatAnimation: FormatAnimation.scale,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange,
        todayColor: Color.fromARGB(200, 254, 154, 46),
        markersColor: Colors.brown,
      ),
      onDaySelected: _onDaySelected,
    );
  }

//하단 리스트 뷰
  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: PwCard(
                  child: Text("복용 여부"),
                ),
              ))
          .toList(),
    );
  }
}
