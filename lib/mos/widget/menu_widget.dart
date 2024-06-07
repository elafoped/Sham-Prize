import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/mos/screenes/ads/ads.dart';
import 'package:smart_admin_dashboard/mos/screenes/profile/sas.dart';
import 'package:smart_admin_dashboard/mos/utilites/utilites.dart';
import 'package:smart_admin_dashboard/screens/Customers/customers_screen.dart';
import 'package:smart_admin_dashboard/screens/Delegates/delegate_screen.dart';
import 'package:smart_admin_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:smart_admin_dashboard/screens/home/home_screen.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        bool isDesktop = width > 800; // Adjust the width threshold as needed

        double tabWidth = width * 0.18;
        double fontSize = width * 0.01;
        double logoFontSize = fontSize * 1.75;
        double nameFontSize = fontSize * 1.4;
        double iconSize = fontSize;
        double iconPadding = height * 0.03;
        double bottomPadding = 18.0;
        double containerHeight = height * 0.60;

        Widget verticalTabs = VerticalTabs(
          direction: TextDirection.rtl, // Set the direction to RTL
          indicatorColor: Color.fromARGB(255, 176, 57, 91),
          tabBackgroundColor: mainColor,
          indicatorSide: IndicatorSide.start,
          indicatorWidth: 7,
          selectedTabBackgroundColor: seccanderColor.withOpacity(0.6),
          tabsWidth: tabWidth,
          tabs: <Tab>[
            Tab(
              iconMargin: EdgeInsets.zero,
              child: AbsorbPointer(
                absorbing: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.all(8.0),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0, color: Colors.transparent),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .end, // Align logo text to the end
                            children: [
                              Text(
                                "S",
                                style: TextStyle(
                                  fontSize: logoFontSize, // Adjust as necessary
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily:
                                      'Pacifico', // Example of using a custom font
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 3,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "HAM PRIZE",
                                style: TextStyle(
                                  fontSize: nameFontSize, // Adjust as necessary
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily:
                                      'Pacifico', // Example of using a custom font
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 2,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: iconPadding,
                    ),
                  ],
                ),
              ),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: tobobject(
                  Icons.home_rounded, "الصفحة الرئيسية", fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: tobobject(
                  Icons.file_open_sharp, "إدارة المندوبين", fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child:
                  tobobject(Icons.people, "إدارة العملاء", fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: tobobject(Icons.insert_chart_outlined_sharp,
                  "إدارة الفواتير", fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: tobobject(Icons.format_align_center_sharp,
                  "إدارة المنتجات", fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: tobobject(Icons.volume_down_sharp, "إدارة الاعلانات",
                  fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: tobobject(Icons.wallet_giftcard_rounded, "المسابقات",
                  fontSize, iconSize),
            ),
            Tab(
              child: tobobject(
                  Icons.person_pin, "الصفحة الشخصية", fontSize, iconSize),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end, // Align logout tab to the end
                children: [
                  SizedBox(
                    height: height * 0.055,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: tobobject(Icons.exit_to_app_rounded, "Logout",
                        fontSize, iconSize),
                  ),
                  SizedBox(
                    width: tabWidth,
                    height: containerHeight,
                    child: Container(
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
          contents: <Widget>[
            Container(
              height: height,
              //    color: Colors.black38,
              child: DelegateScreen(),
            ),
            Container(
              color: Colors.white24,
              //  child: DashboardScreen(),
            ),
            Container(
              child: DashboardScreen(),
            ),
            Container(
              child: CustomersScreen(),
            ),
            Container(
              height: height,
              color: Colors.amber,
            ),
            Container(
              height: height,
              color: Colors.red,
            ),
            Container(
              height: height,
              child: Ads(),
            ),
            Container(
              height: height,
              color: Colors.red,
            ),
            Container(
              child: Profile(),
            ),
            Container(
              height: height,
              color: Colors.red,
            ),
          ],
          contentScrollAxis: Axis.vertical,
        );

        if (isDesktop) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: height,
                  child: verticalTabs,
                ),
              ),
            ],
          );
        } else {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Smart Admin Dashboard'),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
            drawer: Drawer(
              child: verticalTabs,
            ),
            body: DashboardScreen(), // Default screen for mobile
          );
        }
      },
    );
  }

  Widget tobobject(
      IconData selectIcon, String dataText, double fontSize, double iconSize) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start, // Align icons and text to the end
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Icon(
              selectIcon,
              color: Colors.white,
              size: iconSize, // Adjust the icon size dynamically
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              dataText,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: fontSize, // Adjust the text size dynamically
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              overflow: TextOverflow.ellipsis, // Ensure text does not overflow
            ),
          ),
        ],
      ),
    );
  }
}
