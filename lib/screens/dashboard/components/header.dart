import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/mos/utilites/utilites.dart';
import 'package:smart_admin_dashboard/mos/widget/Calendar.dart';
import 'package:smart_admin_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /*  if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),*/
        if (!Responsive.isMobile(context))
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مرحباً أ.سامر  👋",
                style: TextStyle(
                  color: myblack,
                  fontFamily: 'Cairo',
                ),
                //    style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "مرحباً بك مجدداً",
                style: TextStyle(
                  color: myblack,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;
    double fontSize = disize.width * 0.015;
    double iconSize = disize.width * 0.013;
    double imageSize = disize.width * 0.037;
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
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
        border: Border.all(color: Colors.white10),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: disize.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: disize.width * 0.01),
                  child: Text(
                    "Today : ${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day} ",
                    style: TextStyle(
                      fontSize: fontSize * 0.8,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: disize.width * 0.01),
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: mainColor,
                      size: iconSize * 1.5,
                    ),
                    onPressed: () async {
                      final selectedDate = await Navigator.push<DateTime>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calendar(),
                        ),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      /*Row(
          /*      children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_pic.png"),
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text(
                "Deniz Çolak",
                style: TextStyle(color: myblack),
              ),
            ),
          Icon(
            Icons.keyboard_arrow_down,
            color: myblack,
          ),
        ],
*/
          ),*/
    );
  }
}/*

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(
          color: myblack,
        ),
        fillColor: bgColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
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
              color: greenColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
            ),
          ),
        ),
      ),
    );
  }
}
*/