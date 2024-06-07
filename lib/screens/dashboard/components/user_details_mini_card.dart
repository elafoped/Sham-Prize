import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:flutter/material.dart';


class UserDetailsMiniCard extends StatelessWidget {
  const UserDetailsMiniCard({
    Key? key,
    required this.title,
    required this.color,
    required this.numberOfIncrease,
  }) : super(key: key);

  final Color color;
  final String title;
  final int numberOfIncrease;

  @override
  Widget build(BuildContext context) {
    Size disize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Row(
        children: [
          Container(
            color: color,
            height: disize.width / 90,
            width: disize.width / 90,
          ),
          Text(
            "$title       $numberOfIncrease",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: myblack, fontFamily: "Cario"),
          ),
        ],
      ),
    );
  }
}
