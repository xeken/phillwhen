import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pillwhen/utils/network_manager.dart';
import 'models/User.dart';
import 'pages/Calendar.dart';
import 'pages/PeopleInfo.dart';
import 'pages/MyPillAddInfo.dart';
import 'pages/home.dart';
import 'pages/MyPill.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lightTheme = ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        primaryColorDark: Colors.black12,
        canvasColor: Colors.white,
        unselectedWidgetColor: Color.fromRGBO(0x3E, 0x3F, 0x61, 1.0),
        textTheme: TextTheme(
          title: TextStyle(
              fontFamily: 'NotoSansKR',
              color: Color.fromRGBO(0x3E, 0x3F, 0x61, 1.0),
              fontWeight: FontWeight.w900,
              fontSize: 35.0),
          caption: TextStyle(
              fontFamily: 'NotoSansKR',
              color: Color.fromRGBO(0x5A, 0x61, 0x7A, 1.0),
              fontWeight: FontWeight.w600,
              fontSize: 17.0),
          body1: TextStyle(
              fontFamily: 'NotoSansKR',
              color: Color.fromRGBO(0x5A, 0x61, 0x7A, 1.0),
              fontSize: 17.0),
          body2: TextStyle(
              fontFamily: 'NotoSansKR', color: Colors.black, fontSize: 15.0),
          display1: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
          display2: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
          display3: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
          display4: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
          headline: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
          subhead: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
          button: TextStyle(fontFamily: 'NotoSansKR', color: Colors.black),
        ));

    var darkTheme = ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Color.fromRGBO(0x09, 0x13, 0x1C, 1.0),
      canvasColor: Color.fromRGBO(0x09, 0x13, 0x1C, 1.0),
      unselectedWidgetColor: Color.fromRGBO(0x1F, 0x32, 0x48, 1.0),
      cardColor: Color.fromRGBO(0x1F, 0x32, 0x48, 1.0),
      brightness: Brightness.dark,
      primaryColorDark: Color.fromRGBO(0x1A, 0x28, 0x35, 1.0),
      textTheme: TextTheme(
        title: TextStyle(
            fontFamily: 'NotoSansKR',
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 35.0),
        caption: TextStyle(
            fontFamily: 'NotoSansKR',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17.0),
        body1: TextStyle(
            fontFamily: 'NotoSansKR', color: Colors.white, fontSize: 17.0),
        body2: TextStyle(
            fontFamily: 'NotoSansKR', color: Colors.white, fontSize: 15.0),
        display1: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
        display2: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
        display3: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
        display4: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
        headline: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
        subhead: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
        button: TextStyle(fontFamily: 'NotoSansKR', color: Colors.white),
      ),
    );
    return MaterialApp(
      home: Main(),
      theme: lightTheme,
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<Main> {
  User _user;

  int _selectedIndex = 0;
  static const TextStyle pageStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _pages;

  NetworkManager networkManager = new NetworkManager();

  @override
  void initState() {
    super.initState();
    _user = networkManager.getUser('i12821');

    _pages = <Widget>[
      Home(),
      Calendar(
        pillHistories: _user.pillHistories,
      ),
      MyPill(),
      PeopleInfo()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//      appBar: AppBar(
//        title: Text("Philsy", style: TextStyle(color: Colors.black),),
//        backgroundColor: Colors.white,
//        elevation: 0.0,
//      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 20.0,
              spreadRadius: 5.0,
              color: Color.fromRGBO(0, 0, 0, 0.05))
        ]),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          elevation: 0.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidCalendar), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.pills), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userFriends), title: Text(''))
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
          showSelectedLabels: false,
        ),
      ),
    ));
  }
}
