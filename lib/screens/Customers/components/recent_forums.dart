import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:flutter/material.dart';

class RecentDiscussions extends StatelessWidget {
  const RecentDiscussions({
    Key? key,
  }) : super(key: key);

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
        children: [
          Text("Recent Open Positions", style: TextStyle(color: myblack)),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label:
                      Text("Position Name", style: TextStyle(color: myblack)),
                ),
                DataColumn(
                  label: Text("Create Date", style: TextStyle(color: myblack)),
                ),
                DataColumn(
                  label: Text("Total Application",
                      style: TextStyle(color: myblack)),
                ),
              ],
              rows: List.generate(
                recentUsers.length,
                (index) => recentUserDataRow(recentUsers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo) {
  return DataRow(
    cells: [
      DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getPlaceColor(userInfo.ID).withOpacity(.2),
            border: Border.all(color: getPlaceColor(userInfo.ID)),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(userInfo.ID!, style: TextStyle(color: myblack)))),
      DataCell(Text(userInfo.date!, style: TextStyle(color: myblack))),
      DataCell(Text(userInfo.posts!, style: TextStyle(color: myblack))),
    ],
  );
}
