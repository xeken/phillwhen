import 'package:flutter/material.dart';
import 'package:pillwhen/models/User.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:pillwhen/utils/network_manager.dart';

class MyPillAddInfo extends StatefulWidget {
  final User user;
  final PillInfo pillInfo;
  final Set<PillInfo> pillInfoList;
  final String btnText;

  const MyPillAddInfo({Key key, this.user, this.pillInfo, this.pillInfoList, this.btnText}) : super(key: key);


  @override
  _MyPillAddInfoState createState() => _MyPillAddInfoState();
}

class _MyPillAddInfoState extends State<MyPillAddInfo> {

  TextEditingController nickNameController;
  TextEditingController countController;

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  DateTime _dateTime;

  NetworkManager networkManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateTime = DateTime.now();

    nickNameController = TextEditingController(text: widget.pillInfo.nickname);
    countController = TextEditingController(text: widget.pillInfo.remainEat != null ? widget.pillInfo.remainEat.toString() : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0).copyWith(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('복약 정보 관리', style: Theme.of(context).textTheme.title,),
            Padding(padding: EdgeInsets.only(bottom: 10.0),),
            TextField(
              controller: nickNameController,
              decoration: InputDecoration(hintText: widget.pillInfo.nickname ?? "약 별명"),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10.0),),
            TextField(
              controller: countController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "약 갯수"),

            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0),),
            Row(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: (){
                    DatePicker.showDatePicker(
                      context,
                      pickerTheme: DateTimePickerTheme(
                        showTitle: true,
                        confirm: Text('Done', style: TextStyle(color: Colors.cyan)),
                        cancel: Text('Cancel', style: TextStyle(color: Colors.red)),
                      ),
                      pickerMode: DateTimePickerMode.time,
                      initialDateTime: _dateTime,
                      locale: _locale,
                      onCancel: () {
                        debugPrint('onCancel');
                      },
                      onChange: (dateTime, List<int> index) {
                        setState(() {
                          _dateTime = dateTime;
                        });
                      },
                      onConfirm: (dateTime, List<int> index) {
                        setState(() {
                          _dateTime = dateTime;
                        });
                      },
                    );
                  },
                  elevation: 6.0,
                  child: Icon(Icons.access_time),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(_dateTime.toString()),
                ),
              ],
            ),
            Expanded(child: Container()),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                var pillInfo = new PillInfo();
                pillInfo.nickname = nickNameController.text;
                pillInfo.remainEat = int.parse(countController.text);
                pillInfo.time = _dateTime;
                widget.pillInfoList.add(pillInfo);
                networkManager.insertPillInfo(pillInfo, widget.user.code);
                Navigator.pop(context);
              },
              elevation: 8.0,
              color: Colors.red,
              textColor: Colors.white,
              child: Text(widget.btnText ?? "수정하기"),
              padding: EdgeInsets.symmetric(vertical: 12.5)
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0))
          ],
        ),
      ),
    );
  }
}
