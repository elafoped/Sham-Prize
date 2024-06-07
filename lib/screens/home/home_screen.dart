

import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/responsive.dart';
import 'package:smart_admin_dashboard/screens/Ads/ads_screen.dart';
import 'package:smart_admin_dashboard/screens/Bills/bills_screen.dart';
import 'package:smart_admin_dashboard/screens/Compation/compation_screen.dart';
import 'package:smart_admin_dashboard/screens/Customers/customers_screen.dart';
import 'package:smart_admin_dashboard/screens/Delegates/delegate_screen.dart';
import 'package:smart_admin_dashboard/screens/Product/product_screen.dart';
import 'package:smart_admin_dashboard/screens/Profile/profile_screen.dart';
import 'package:smart_admin_dashboard/screens/dashboard/dashboard_screen.dart';

import 'components/side_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentPage = DashboardScreen(); // الصفحة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SideMenu يظهر فقط عندما يكون الشاشة كبيرة
            if (Responsive.isDesktop(context))
              Expanded(
                // افتراضياً flex = 1
                // ويأخذ 1/6 جزء من الشاشة
                child: SideMenu(
                  onPageSelected: (index) {
                    setState(() {
                      // تعيين الصفحة الحالية بناءً على الفهرس المحدد
                      switch (index) {
                        case 0:
                          currentPage = DashboardScreen();
                          break;
                        case 1:
                          currentPage = DelegateScreen();
                          break;
                        case 2:
                          currentPage = CustomersScreen();
                          break;
                        case 3:
                          currentPage = BillsScreen();
                          break;
                        case 4:
                          currentPage = ProductScreen();
                          break;
                        case 5:
                          currentPage = ADsScreen();
                          break;
                        case 6:
                          currentPage = ComptionScreen();
                          break;
                        case 7:
                          currentPage = ProfileScreen();

                          break;
                        // قم بإضافة المزيد من الحالات حسب الحاجة
                      }
                    });
                  },
                ),
              ),
            Expanded(
              // يأخذ 5/6 جزء من الشاشة
              flex: 5,
              // عرض الصفحة الحالية
              child: currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
