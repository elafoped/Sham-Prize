import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/models/daily_info_model.dart';

import 'package:smart_admin_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/Customers/components/mini_information_widget.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/mini_information_widget.dart';
import 'package:smart_admin_dashboard/screens/forms/input_form.dart';

class MiniInformationdash extends StatelessWidget {
  final List<DailyInfoModel> filteredDailyDatas;

  const MiniInformationdash({
    Key? key,
    required this.filteredDailyDatas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: InformationCard(
            filteredDailyDatas: filteredDailyDatas,
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: InformationCard(filteredDailyDatas: filteredDailyDatas),
          desktop: InformationCard(
            filteredDailyDatas: filteredDailyDatas,
            childAspectRatio: _size.width < 1400 ? 1.2 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
  final List<DailyInfoModel> filteredDailyDatas;
  final int crossAxisCount;
  final double childAspectRatio;

  const InformationCard({
    Key? key,
    required this.filteredDailyDatas,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredDailyDatas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return MiniInformationWidgetdash(
          dailyData: filteredDailyDatas[index],
        );
      },
    );
  }
}
