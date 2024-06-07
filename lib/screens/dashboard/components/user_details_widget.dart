/*import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/screens/Ads/components/charts.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/charts.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/user_details_mini_card.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "نسب المبيع حسب المندوب",
            style: TextStyle(
              fontFamily: "Cario",
              fontSize: 18,
              color: myblack,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          UserDetailsMiniCard(
            color: Color(0xff0293ee),
            title: "عامر",
            //   amountOfFiles: "%28.3",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "محسن",
            //   amountOfFiles: "%16.7",
            numberOfIncrease: 138,
          ),
          UserDetailsMiniCard(
            color: Color(0xff845bef),
            title: "عمر",
            // amountOfFiles: "%22.4",
            numberOfIncrease: 328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff13d38e),
            title: "Rejected",
            //   amountOfFiles: "%2.3",
            numberOfIncrease: 140,
          ),
        ],
      ),
    );
  }
}
*/

import 'dart:math';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/Ads/components/charts.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/user_details_mini_card.dart';

import 'dart:math';
import 'package:flutter/material.dart';

// دالة للحصول على لون عشوائي
Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    random.nextInt(156) + 100,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  _UserDetailsWidgetState createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  final List<UserDetailsMiniCard> userDetailCards = [
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "عامر",
      numberOfIncrease: 1328,
    ),
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "محسن",
      numberOfIncrease: 138,
    ),
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "عمر",
      numberOfIncrease: 328,
    ),
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "Rejected",
      numberOfIncrease: 140,
    ),
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "محسن",
      numberOfIncrease: 138,
    ),
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "عمر",
      numberOfIncrease: 328,
    ),
    UserDetailsMiniCard(
      color: getRandomColor(),
      title: "Rejected",
      numberOfIncrease: 140,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "نسب المبيع حسب المندوب:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              color: myblack,
            ),
            /* TextStyle(
              fontFamily: "Cairo",
              fontSize: disize.width / 73,
              color: myblack,
              fontWeight: FontWeight.w500,
            ),*/
          ),
          SizedBox(height: defaultPadding),
          Row(
            children: [
              Chart(userDetailCards: userDetailCards),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...userDetailCards,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
