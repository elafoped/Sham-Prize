import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/models/daily_info_model.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniInformationWidgetco extends StatefulWidget {
  const MiniInformationWidgetco({
    Key? key,
    required this.dailyData,
  }) : super(key: key);
  final DailyInfoModel dailyData;

  @override
  _MiniInformationWidgetcoState createState() =>
      _MiniInformationWidgetcoState();
}

int _value = 1;

class _MiniInformationWidgetcoState extends State<MiniInformationWidgetco> {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.dailyData.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child:  widget.dailyData.image,
                
                /*Icon(
                  widget.dailyData.icon,
                  color: widget.dailyData.color,
                  size: 18,
                ),*/
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: DropdownButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: 18,
                    color: myblack,
                  ),
                  underline: SizedBox(),
                  focusColor: bgColor,
                  dropdownColor: maincolor,
                  //    style: Theme.of(context).textTheme.button,
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Daily",
                        style: TextStyle(color: myblack),
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Weekly",
                        style: TextStyle(color: myblack),
                      ),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: myblack),
                      ),
                      value: 3,
                    ),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.dailyData.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              /* Container(
                child: LineChartWidget(
                  colors: widget.dailyData.colors,
                  spotsData: widget.dailyData.spots,
                ),
              )*/
            ],
          ),
          SizedBox(
            height: 8,
          ),
          /*       ProgressLine(
            color: widget.dailyData.color!,
            percentage: widget.dailyData.percentage!,
          ),
 */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.dailyData.volumeData}",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: myblack),
              ),
              Text(
                widget.dailyData.totalStorage!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: myblack),
              ),
            ],
          )
        ],
      ),
    );
  }
}