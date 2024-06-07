/*import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/init/provider_list.dart';
import 'package:smart_admin_dashboard/screens/home/home_screen.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
        future: null,
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dashboard - Admin Panel v0.1 ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: maincolor, elevation: 0),
        scaffoldBackgroundColor: maincolor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        canvasColor: secondaryColor,
      ),
      //  home: Login(title: "Wellcome to the Admin & Dashboard Panel"),
      home: HomeScreen(),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/mos/HomePage.dart';
import 'package:smart_admin_dashboard/mos/widget/Calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShamPrize_web',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/HomePage',
      routes: {
        "/HomePage": (context) => Homepage(),
        "/calendar": (context) => Calendar(),
      },
    );
  }
}
