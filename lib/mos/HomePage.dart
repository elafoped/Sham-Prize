import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_admin_dashboard/mos/widget/menu_widget.dart';


import 'package:vertical_tabs_flutter/vertical_tabs.dart';
class Homepage extends StatelessWidget {
  static const String route = " /HomePage";
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Row(
          children: [
            Expanded(
              //flex: 2,
                child: Menu()),


          ],
        ),
      ),
    );
  }

}
