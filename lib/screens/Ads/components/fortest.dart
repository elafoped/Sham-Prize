import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class testads extends StatelessWidget {
  const testads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int getDaysInCurrentMonth() {
      final now = DateTime.now();
      final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
      return daysInMonth;
    }

    List<double> generateRandomData(int daysInMonth) {
      Random random = Random();
      return List.generate(daysInMonth, (index) {
        // توليد عدد عشوائي بين 0 و 100 كقيمة لكل يوم
        return random.nextDouble() * 40;
      });
    }

    int daysInMonth =
        getDaysInCurrentMonth(); // يجب استبدالها بعدد أيام الشهر الفعلي
    List<double> data1 = generateRandomData(daysInMonth);
    List<double> data2 = generateRandomData(daysInMonth);

    return Container(
      width: double.infinity,
      height: 400,
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
          SizedBox(
            height: defaultPadding,
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ads',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: myblack,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.only(right: 5),
                    color: Color.fromARGB(255, 0, 106, 255),
                  ),
                  Text(
                    'Today',
                    style: TextStyle(fontSize: 14, color: myblack),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    color: Color.fromARGB(255, 153, 195, 255),
                  ),
                  Text(
                    'Yesterday',
                    style: TextStyle(fontSize: 14, color: myblack),
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            height: 300,
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
                          y: data1[index],
                          colors: [Color.fromARGB(255, 0, 106, 255)],
                          width: 8,
                        ),
                        BarChartRodData(
                          y: data2[index],
                          colors: [Color.fromARGB(255, 153, 195, 255)],
                          width: 8,
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
        ],
      ),

      /*   Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Align(
              alignment: Alignment.center,
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
                            y: data1[index],
                            colors: [Color.fromARGB(255, 0, 106, 255)],
                            width: 8,
                          ),
                          BarChartRodData(
                            y: data2[index],
                            colors: [Color.fromARGB(255, 153, 195, 255)],
                            width: 8,
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
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'بيانات الرسم البياني',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: myblack),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(right: 5),
                  color: Color.fromARGB(255, 0, 106, 255),
                ),
                Text(
                  'شرح للبيانات 1',
                  style: TextStyle(fontSize: 14, color: myblack),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Color.fromARGB(255, 153, 195, 255),
                ),
                Text(
                  'شرح للبيانات 2',
                  style: TextStyle(fontSize: 14, color: myblack),
                ),
              ],
            ),
          ),
        ],
      ),*/
    );
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
