import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/*
  CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_pic.png"),
          ),*/
class DailyInfoModel {
// توليد الأرقام العشوائية
  //imageData? image;
  CircleAvatar? image;
  String? title;
  String? totalStorage;
  int? volumeData;
  int? percentage;
  Color? color;
  List<Color>? colors;

  DailyInfoModel({
    this.image,
    this.title,
    this.totalStorage,
    this.volumeData,
    this.percentage,
    this.color,
    this.colors,
  });

  DailyInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    volumeData = json['volumeData'];
    image = json['image'];
    totalStorage = json['totalStorage'];
    color = json['color'];
    percentage = json['percentage'];
    colors = json['colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['volumeData'] = this.volumeData;
    data['image'] = this.image;
    data['totalStorage'] = this.totalStorage;
    data['color'] = this.color;
    data['percentage'] = this.percentage;
    data['colors'] = this.colors;
    //  data['spots'] = this.spots;
    return data;
  }
}

List<DailyInfoModel> dailyDatas =
    dailyData.map((item) => DailyInfoModel.fromJson(item)).toList();

//List<FlSpot> spots = yValues.asMap().entries.map((e) {
//  return FlSpot(e.key.toDouble(), e.value);
//}).toList();

var dailyData = [
  {
    "title": "Employee",
    "volumeData": 132,
    // //"image": Flutterimages.user_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "totalStorage": "+ %20",
    "color": primaryColor,
    "percentage": 35,
    "colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
  },
  {
    "title": "On Leave",
    "volumeData": 100,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "totalStorage": "+ %5",
    "color": Color(0xFFFFA113),
    "percentage": 5,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],
  },
  {
    "title": "حلاوة 400غ فستق",
    "volumeData": 128,
    //"image": Flutterimages.comment_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFA4CDFF),
    "percentage": 10,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],
  },
  {
    "title": "Open Position",
    "volumeData": 328,
    //"image": Flutterimages.heart_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFd50000),
    "percentage": 10,
    "colors": [Color(0xff93291E), Color(0xffED213A)],
  },
  {
    "title": "Efficiency",
    "volumeData": 5328,
    //"image": Flutterimages.bell_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "%5",
    "color": Color(0xFF00F260),
    "percentage": 78,
    "colors": [Color(0xff0575E6), Color(0xff00F260)],
  },
  {
    "title": "Employee",
    "volumeData": 1328,
    // //"image": Flutterimages.user_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "totalStorage": "+ %20",
    "color": primaryColor,
    "percentage": 35,
    "colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
  },
  {
    "title": "On Leave",
    "volumeData": 100,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %5",
    "color": Color(0xFFFFA113),
    "percentage": 5,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],
  },
  {
    "title": "Onboarding",
    "volumeData": 1328,
    //"image": Flutterimages.comment_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFA4CDFF),
    "percentage": 10,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],
  },
  {
    "title": "Open Position",
    "volumeData": 1328,
    //"image": Flutterimages.heart_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFd50000),
    "percentage": 10,
    "colors": [Color(0xff93291E), Color(0xffED213A)],
  },
  {
    "title": "Efficiency",
    "volumeData": 5328,
    //"image": Flutterimages.bell_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "%5",
    "color": Color(0xFF00F260),
    "percentage": 78,
    "colors": [Color(0xff0575E6), Color(0xff00F260)],
  },
  {
    "title": "Employee",
    "volumeData": 1328,
    // //"image": Flutterimages.user_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "totalStorage": "+ %20",
    "color": primaryColor,
    "percentage": 35,
    "colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
  },
  {
    "title": "On Leave",
    "volumeData": 100,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %5",
    "color": Color(0xFFFFA113),
    "percentage": 5,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],
  },
  {
    "title": "Onboarding",
    "volumeData": 1328,
    //"image": Flutterimages.comment_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFA4CDFF),
    "percentage": 10,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],
  },
  {
    "title": "Open Position",
    "volumeData": 1328,
    //"image": Flutterimages.heart_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFd50000),
    "percentage": 10,
    "colors": [Color(0xff93291E), Color(0xffED213A)],
  },
  {
    "title": "Efficiency",
    "volumeData": 5328,
    //"image": Flutterimages.bell_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "%5",
    "color": Color(0xFF00F260),
    "percentage": 78,
    "colors": [Color(0xff0575E6), Color(0xff00F260)],
  },
  {
    "title": "Employee",
    "volumeData": 1328,
    // //"image": Flutterimages.user_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "totalStorage": "+ %20",
    "color": primaryColor,
    "percentage": 35,
    "colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],
  },
  {
    "title": "On Leave",
    "volumeData": 100,
    "image": CircleAvatar(
      backgroundImage: AssetImage("images/halva.jpg"),
    ),
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %5",
    "color": Color(0xFFFFA113),
    "percentage": 5,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],
  },
  {
    "title": "Onboarding",
    "volumeData": 1328,
    //"image": Flutterimages.comment_alt_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFA4CDFF),
    "percentage": 10,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],
  },
  {
    "title": "Open Position",
    "volumeData": 1328,
    //"image": Flutterimages.heart_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "+ %8",
    "color": Color(0xFFd50000),
    "percentage": 10,
    "colors": [Color(0xff93291E), Color(0xffED213A)],
  },
  {
    "title": "Efficiency",
    "volumeData": 5328,
    //"image": Flutterimages.bell_faw5s,
    "image": CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile_pic.png"),
    ),
    "totalStorage": "%5",
    "color": Color(0xFF00F260),
    "percentage": 78,
    "colors": [Color(0xff0575E6), Color(0xff00F260)],
  },
];

generateRandomData() {
  Random random = Random();
  return random.nextDouble() * 10;
}
