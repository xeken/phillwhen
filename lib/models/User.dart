import 'package:flutter/material.dart';

import 'PillHistory.dart';
import 'PillInfo.dart';

class User {

  String name;
  String code;
  String profileImageUri;
  List<PillHistory> pillHistories;
  List<String> friends;
  void makedata(){
    this.name = "김동현";
    this.code = "a1b2c3";
    this.profileImageUri = "http://i.dailymail.co.uk/i/pix/2015/09/01/18/2BE1E88B00000578-3218613-image-m-5_1441127035222.jpg";
  }
  void makedata2(){
    this.name = "김대용";
    this.code = "1a2s3d";
    this.profileImageUri = "https://sample-videos.com/img/Sample-jpg-image-500kb.jpg";
  }
}

User dummyUser() {
  var user = User();
  user.name = "김대용";
  user.code = "2Dqi8Ww";
  user.profileImageUri = "https://sample-videos.com/img/Sample-jpg-image-500kb.jpg";

  var pillInfo1 = PillInfo();
  pillInfo1.pillCount = 5;
  pillInfo1.key = 1;
  pillInfo1.remainingPills = 5;
  pillInfo1.time = TimeOfDay.now();

  var pillInfo2 = PillInfo();
  pillInfo2.pillCount = 1;
  pillInfo2.key = 2;
  pillInfo2.remainingPills = 4;
  pillInfo2.time = TimeOfDay.now();

  var pillInfo3 = PillInfo();
  pillInfo3.pillCount = 2;
  pillInfo3.key = 3;
  pillInfo3.remainingPills = 2;
  pillInfo3.time = TimeOfDay.now();
  
  var history = PillHistory();
  history.morning = pillInfo1;
  history.morningStatus = true;

  history.lunch = pillInfo2;
  history.lunchStatus = false;
  
  history.dinner = pillInfo3;
  history.dinnerStatus = false;
  
  history.date = DateTime.now();
  
  user.pillHistories = [history];
  
  return user;
}