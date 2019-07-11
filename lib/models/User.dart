import 'package:flutter/material.dart';

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String code;
  String name;
  String profilePictureUri;
  DateTime createdAt;
  DateTime updatedAt;
  List<PillHistory> pillHistories;

  User({
    this.code,
    this.name,
    this.profilePictureUri,
    this.createdAt,
    this.updatedAt,
    this.pillHistories,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    code: json["code"],
    name: json["name"],
    profilePictureUri: json["profilePictureUri"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    pillHistories: new List<PillHistory>.from(json["pillHistories"].map((x) => PillHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "profilePictureUri": profilePictureUri,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "pillHistories": new List<dynamic>.from(pillHistories.map((x) => x.toJson())),
  };
}

class PillHistory {
  int idx;
  int morningPill;
  int lunchPill;
  int dinnerPill;
  bool isEatMorning;
  bool isEatLunch;
  bool isEatDinner;
  String code;
  DateTime time;
  DateTime createdAt;
  DateTime updatedAt;
  PillInfo morning;
  PillInfo lunch;
  PillInfo dinner;

  PillHistory({
    this.idx,
    this.morningPill,
    this.lunchPill,
    this.dinnerPill,
    this.isEatMorning,
    this.isEatLunch,
    this.isEatDinner,
    this.code,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.morning,
    this.lunch,
    this.dinner,
  });

  factory PillHistory.fromJson(Map<String, dynamic> json) => new PillHistory(
    idx: json["idx"],
    morningPill: json["morningPill"],
    lunchPill: json["lunchPill"],
    dinnerPill: json["dinnerPill"],
    isEatMorning: json["isEatMorning"],
    isEatLunch: json["isEatLunch"],
    isEatDinner: json["isEatDinner"],
    code: json["code"],
    time: DateTime.parse(json["time"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    morning: PillInfo.fromJson(json["morning"]),
    lunch: PillInfo.fromJson(json["lunch"]),
    dinner: PillInfo.fromJson(json["dinner"]),
  );

  Map<String, dynamic> toJson() => {
    "idx": idx,
    "morningPill": morningPill,
    "lunchPill": lunchPill,
    "dinnerPill": dinnerPill,
    "isEatMorning": isEatMorning,
    "isEatLunch": isEatLunch,
    "isEatDinner": isEatDinner,
    "code": code,
    "time": time.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "morning": morning.toJson(),
    "lunch": lunch.toJson(),
    "dinner": dinner.toJson(),
  };
}

class PillInfo {
  int idx;
  DateTime time;
  int pillNumber;
  int remainEat;
  String code;
  String nickname;
  DateTime createdAt;
  DateTime updatedAt;

  PillInfo({
    this.idx,
    this.time,
    this.pillNumber,
    this.remainEat,
    this.code,
    this.nickname,
    this.createdAt,
    this.updatedAt,
  });

  factory PillInfo.fromJson(Map<String, dynamic> json) => new PillInfo(
    idx: json["idx"],
    time: DateTime.parse(json["time"]),
    pillNumber: json["pillNumber"],
    remainEat: json["remainEat"],
    code: json["code"],
    nickname: json["nickname"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "idx": idx,
    "time": time.toIso8601String(),
    "pillNumber": pillNumber,
    "remainEat": remainEat,
    "code": code,
    "nickname": nickname,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
