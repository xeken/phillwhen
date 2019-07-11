import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:async';

import 'package:pillwhen/models/User.dart';

const j = """
{
    "code": "Fadz4IH",
    "name": "김대용",
    "profilePictureUri": "https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-9/32508762_606806973014817_9098627413276884992_o.jpg?_nc_cat=101&_nc_oc=AQm3rfLuQFqNXWTwzKesqM860EJMhtOTraxwhypoUE9-qU2t9z8I3liU9CF7_NEFcDk&_nc_ht=scontent-icn1-1.xx&oh=95bb70124ab9a7e5f4869b16316b3c74&oe=5D79DE07",
    "createdAt": "2019-07-11T02:06:43.000Z",
    "updatedAt": "2019-07-11T02:06:43.000Z",
    "pillHistories": [
        {
            "idx": 1,
            "morningPill": 1,
            "lunchPill": 2,
            "dinnerPill": 4,
            "isEatMorning": false,
            "isEatLunch": false,
            "isEatDinner": false,
            "code": "Fadz4IH",
            "time": "2019-07-11T02:06:43.000Z",
            "createdAt": "2019-07-11T02:06:43.000Z",
            "updatedAt": "2019-07-11T02:06:43.000Z",
            "morning": {
                "idx": 1,
                "time": "2019-07-11T02:06:43.000Z",
                "pillNumber": 10,
                "remainEat": 5,
                "code": "Fadz4IH",
                "createdAt": "2019-07-11T02:06:43.000Z",
                "updatedAt": "2019-07-11T02:06:43.000Z"
            },
            "lunch": {
                "idx": 2,
                "time": "2019-07-11T11:06:57.000Z",
                "pillNumber": 10,
                "remainEat": 5,
                "code": "Fadz4IH",
                "createdAt": "2019-07-11T11:06:57.000Z",
                "updatedAt": "2019-07-11T11:06:57.000Z"
            },
            "dinner": {
                "idx": 4,
                "time": "2019-07-11T11:07:04.000Z",
                "pillNumber": 10,
                "remainEat": 5,
                "code": "Fadz4IH",
                "createdAt": "2019-07-11T11:07:04.000Z",
                "updatedAt": "2019-07-11T11:07:04.000Z"
            }
        }
    ]
}
""";

class NetworkManager {
  static const String SERVER_URL = "https://xxxx.xxxx.x.xx.x.x/";
  static const String USER_URL = "users";
  static const String PILLINFO_URL = "pillInfos";

  Dio _getClient() {
    return Dio();
  }

  Future<User> getUser(String code) async {
//    var response = await _request(_createURL(USER_URL + "/$code"), Method.GET);
//    var responseData = User.fromJson(response.data);
    var responseData = User.fromJson(json.decode(j));
    return responseData;
  }

  Future insertPillInfo(PillInfo p, String userCode) async {
    var response = await _request(_createURL(PILLINFO_URL), Method.POST, data: json.encode(p), userCode: userCode);
    var responseData = PillInfo.fromJson(response.data);
    return responseData;
  }

  Future<Response> _request(String path, String method, {data, String userCode, Map<String, dynamic> headers}) async {
    if(headers == null) headers = {};
    if(userCode != null) headers["Authorization"] = userCode;

    var opt = Options(
      method: method,
      headers: headers,
    );
    try {
      var response = await _getClient().request(path, data: data, options: opt);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  String _createURL(String target) {
    return SERVER_URL + target;
  }
}

class Method {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";
}