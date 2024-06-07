import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/responsive.dart';
import 'package:smart_admin_dashboard/screens/Ads/components/fortest.dart';
import 'package:smart_admin_dashboard/screens/Profile/components/fortest.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/fortest.dart';

import 'package:flutter/material.dart';

import 'components/header.dart';

class ProfileScreen extends StatelessWidget {
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
              testf(),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
