import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/models/daily_info_model.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniInformationWidgetdash extends StatefulWidget {
  const MiniInformationWidgetdash({
    Key? key,
    required this.dailyData,
  }) : super(key: key);
  final DailyInfoModel dailyData;

  @override
  _MiniInformationWidgetdashState createState() =>
      _MiniInformationWidgetdashState();
}

int _value = 1;

class _MiniInformationWidgetdashState extends State<MiniInformationWidgetdash> {
  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;
    double fontSize = disize.width * 0.015;
    double iconSize = disize.width * 0.013;
    double imageSize = disize.width * 0.037;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // لون الظل
            spreadRadius: 2, // تحديد انتشار الظل
            blurRadius: 4, // تحديد ضبابية الظل
            offset: Offset(0,
                4), // تحديد موقع الظل (0, 4) تعني الظل سيكون أسفل الكونتينر بمقدار 4 وحدات عمودياً
          ),
        ],
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.25),
                height: disize.width / 30,
                //disize.height / 16.5,
                width: disize.width / 30,
                decoration: BoxDecoration(
                  color: widget.dailyData.color!.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: widget.dailyData.image,
              
              ),
             
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          widget.dailyData.title!,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: fontSize / 1.5),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             

              SizedBox(
                height: 8,
              ),
              Container(
                child: LineChartWidget(
                  colors: widget.dailyData.colors,
                  //spotsData: spot,
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          ProgressLine(
            color: widget.dailyData.color!,
            percentage: widget.dailyData.percentage!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.dailyData.volumeData}",
                style: TextStyle(fontSize: fontSize / 1.5),
                
              ),
              Text(
                widget.dailyData.totalStorage!,
                style: TextStyle(fontSize: fontSize / 1.5),

              ),
            ],
          )
        ],
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  List<FlSpot>? spot = [
    FlSpot(
      1,
      generateRandomData(),
    ),
    FlSpot(
      2,
      generateRandomData(),
    ),
    FlSpot(
      3,
      generateRandomData(),
    ),
    FlSpot(
      4,
      generateRandomData(),
    ),
    FlSpot(
      5,
      generateRandomData(),
    ),
    FlSpot(
      6,
      generateRandomData(),
    ),
    FlSpot(
      7,
      generateRandomData(),
    ),
    FlSpot(
      8,
      generateRandomData(),
    )
  ];

  LineChartWidget({
    Key? key,
    required this.colors,
    // this.spot,
  }) : super(key: key);
  List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: disize.width / 20,
          height: disize.height / 30,
          child: LineChart(
            LineChartData(
                lineBarsData: [
                  LineChartBarData(
                      spots: spot,
                      belowBarData: BarAreaData(show: false),
                      aboveBarData: BarAreaData(show: false),
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      colors: colors,
                      barWidth: 3),
                ],
                lineTouchData: LineTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                axisTitleData: FlAxisTitleData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false)),
          ),
        ),
      ],
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
