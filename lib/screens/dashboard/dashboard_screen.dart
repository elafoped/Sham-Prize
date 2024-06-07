import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/models/daily_info_model.dart';
import 'package:smart_admin_dashboard/screens/Customers/components/recent_forums.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/fortest.dart';

import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/mini_information_card.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/target_month_widget.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/user_details_widget.dart';

import 'components/header.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController filterControllerdown = TextEditingController();
  TextEditingController filterControllerup = TextEditingController();
  late List<DailyInfoModel> filteredDailyDatas;
  TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDailyDatas = dailyDatas; // بدايةً، عرض جميع البيانات
  }

  void filterData() {
    setState(() {
      int filterValuedown = int.tryParse(filterControllerdown.text) ?? 0;
      int filterValueup = int.tryParse(filterControllerup.text) ?? 0;
      filteredDailyDatas = dailyDatas
          .where((data) =>
              data.volumeData! <= filterValueup &&
              data.volumeData! >= filterValuedown)
          .toList();
    });
  }

  void showMostSoldItem() {
    setState(() {
      filteredDailyDatas = [
        dailyDatas.reduce((curr, next) =>
            curr.volumeData! > next.volumeData!.toInt() ? curr : next)
      ];
    });
  }

  void showLeastSoldItem() {
    setState(() {
      filteredDailyDatas = [
        dailyDatas.reduce((curr, next) =>
            curr.volumeData! < next.volumeData!.toInt() ? curr : next)
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              testdash(),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(child: UserDetailsWidget()),
                  SizedBox(width: defaultPadding),
                  Expanded(child: UserDetailsWidget()),
                ],
              ),
              SizedBox(height: defaultPadding),
              TargetMonthWidget(),
              SizedBox(height: defaultPadding),
              Container(
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: filterControllerdown,
                            decoration: InputDecoration(
                              labelText: 'بين',
                              labelStyle: TextStyle(fontFamily: "cario"),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: filterControllerup,
                            decoration: InputDecoration(
                              labelText: '  وبين',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: defaultPadding),
                        ElevatedButton(
                          onPressed: filterData,
                          child: Text("فلترة البيانات"),
                        ),
                        SizedBox(width: defaultPadding),
                        ElevatedButton(
                          onPressed: showMostSoldItem,
                          child: Text("الأكثر مبيعاً"),
                        ),
                        SizedBox(width: defaultPadding),
                        ElevatedButton(
                          onPressed: showLeastSoldItem,
                          child: Text("الأقل مبيعاً"),
                        ),
                      ],
                    ),
                  ),
                  MiniInformationdash(filteredDailyDatas: filteredDailyDatas),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
