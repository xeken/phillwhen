import 'PillInfo.dart';

class User {

  String name;
  String code;
  String profileImageUri;
  PillInfo pillInfo;
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