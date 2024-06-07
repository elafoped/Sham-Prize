import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class testdash extends StatefulWidget {
  const testdash({
    Key? key,
  }) : super(key: key);

  @override
  State<testdash> createState() => _testdashState();
}

int _value1 = 1;

class _testdashState extends State<testdash> {
  List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  String _selectedText =
      "Select an option"; // تعريف _selectedText كمتغير في الحالة

  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;

    int getDaysInCurrentMonth() {
      final now = DateTime.now();
      final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
      return daysInMonth;
    }

    List<double> generateRandomData(int daysInMonth) {
      Random random = Random();
      return List.generate(daysInMonth, (index) {
        return random.nextDouble() * 1000;
      });
    }

    int daysInMonth = getDaysInCurrentMonth();
    List<double> data1 = generateRandomData(daysInMonth);
    List<double> data2 = generateRandomData(daysInMonth);

    return Container(
      width: double.infinity,
      height: disize.height / 1.6,
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
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'معدل المبيعات "ل.س"',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      color: myblack,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 18,
                      color: myblack,
                    ),
                    underline: SizedBox(),
                    focusColor: bgColor,
                    dropdownColor: maincolor,
                    //    style: Theme.of(context).textTheme.button,
                    value: _value1,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "شهرياً",
                          style: TextStyle(color: myblack),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "اسبوعياً",
                          style: TextStyle(color: myblack),
                        ),
                        value: 2,
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _value1 = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: defaultPadding,
          ),
          if (_value1 == 1) // إذا كانت قيمة _value تساوي 1، عرض الشكل
            Container(
              height: disize.height / 2.6,
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    barTouchData: BarTouchData(enabled: false),
                    barGroups: List.generate(
                      getDaysInCurrentMonth(),
                      (index) => BarChartGroupData(
                        x: index + 1,
                        barRods: [
                          BarChartRodData(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            y: data1[index],
                            colors: [Color.fromARGB(255, 0, 106, 255)],
                            width: disize.width / 200,
                          ),
                          BarChartRodData(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            y: data2[index],
                            colors: [Color.fromARGB(255, 153, 195, 255)],
                            width: disize.width / 200,
                          ),
                        ],
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(showTitles: true),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          return value.toInt().toString();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          else // إلا، عرض النص فقط
            Container(
              height: disize.height / 2.6,
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    barTouchData: BarTouchData(enabled: false),
                    barGroups: List.generate(
                      7,
                      (index) => BarChartGroupData(
                        x: index + 1,
                        barRods: [
                          BarChartRodData(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            y: data1[index],
                            colors: [Color.fromARGB(255, 0, 106, 255)],
                            width: 15,
                          ),
                          BarChartRodData(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            y: data2[index],
                            colors: [Color.fromARGB(255, 153, 195, 255)],
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(showTitles: true),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (double value) {
                          return value.toInt().toString();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: disize.height / 70,
                  height: disize.height / 70,
                  margin: EdgeInsets.only(right: 5),
                  color: Color.fromARGB(255, 0, 106, 255),
                ),
                Text(
                  'اليوم',
                  style: TextStyle(fontSize: 14, color: myblack),
                ),
                Container(
                  width: disize.height / 70,
                  height: disize.height / 70,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Color.fromARGB(255, 153, 195, 255),
                ),
                Text(
                  'البارحة',
                  style: TextStyle(fontSize: 14, color: myblack),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int getDaysInCurrentMonth() {
    final now = DateTime.now();
    final beginningNextMonth = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 1)
        : DateTime(now.year + 1, 1, 1);
    return beginningNextMonth
        .difference(DateTime(now.year, now.month, 1))
        .inDays;
  }
}

DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: myblack,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.name!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                style: TextStyle(color: myblack),
                userInfo.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getPlaceColor(userInfo.ID).withOpacity(.2),
            border: Border.all(color: getPlaceColor(userInfo.ID)),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(
            userInfo.ID!,
            style: TextStyle(color: myblack),
          ))),
      DataCell(Text(
        userInfo.email!,
        style: TextStyle(color: myblack),
      )),
      DataCell(Text(
        userInfo.date!,
        style: TextStyle(color: myblack),
      )),
      DataCell(Text(
        userInfo.posts!,
        style: TextStyle(color: myblack),
      )),
      DataCell(
        Row(
          children: [
            TextButton(
              child: Text('View', style: TextStyle(color: greenColor)),
              onPressed: () {},
            ),
            SizedBox(
              width: 6,
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Icon(Icons.warning_outlined,
                                    size: 36, color: Colors.red),
                                SizedBox(height: 20),
                                Text("Confirm Deletion"),
                              ],
                            ),
                          ),
                          content: Container(
                            color: secondaryColor,
                            // color: bgColor,
                            height: 70,
                            child: Column(
                              children: [
                                Text(
                                    "Are you sure want to delete '${userInfo.name}'?"),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.close,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: Text("Cancel")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () {},
                                        label: Text("Delete"))
                                  ],
                                )
                              ],
                            ),
                          ));
                    });
              },
              // Delete
            ),
          ],
        ),
      ),
    ],
  );
}
