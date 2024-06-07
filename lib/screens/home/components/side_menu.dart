import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.onPageSelected,
  }) : super(key: key);

  final Function(int) onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: defaultPadding * 3),
                  Image.asset(
                    "assets/logo/logo_icon.png",
                    scale: 5,
                  ),
                  SizedBox(height: defaultPadding),
                  Text("Smart HR - Application")
                ],
              ),
            ),
            DrawerListTile(
              title: "Home",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () => onPageSelected(0),
            ),
            DrawerListTile(
              title: "Delegates",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () => onPageSelected(1),
            ),
            DrawerListTile(
              title: "Customers",
              svgSrc: "assets/icons/menu_task.svg",
              press: () => onPageSelected(2),
            ),
            DrawerListTile(
              title: "Bills",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () => onPageSelected(3),
            ),
            DrawerListTile(
              title: "Product",
              svgSrc: "assets/icons/menu_store.svg",
              press: () => onPageSelected(4),
            ),
            DrawerListTile(
              title: "Ads",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () => onPageSelected(5),
            ),
            DrawerListTile(
              title: "Competitions",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () => onPageSelected(6),
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () => onPageSelected(7),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
