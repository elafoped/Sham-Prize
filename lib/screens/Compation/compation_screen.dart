import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/responsive.dart';
import 'package:smart_admin_dashboard/screens/Ads/components/fortest.dart';
import 'package:smart_admin_dashboard/screens/Compation/components/fortest.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/fortest.dart';

import 'package:flutter/material.dart';

import 'components/header.dart';

class ComptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              //سيرش الترحيب والبروواقايل
              Header(),
              SizedBox(height: defaultPadding),
              SizedBox(height: defaultPadding),
              testcom(),
              SizedBox(height: defaultPadding),

              /*         Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        //MyFiels(),
                        //SizedBox(height: defaultPadding),
                        RecentUsers(),
                        SizedBox(height: defaultPadding),
                        RecentDiscussions(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: UserDetailsWidget(),
                    ),
                ],
              )
   */
            ],
          ),
        ),
      ),
    );
  }
}
