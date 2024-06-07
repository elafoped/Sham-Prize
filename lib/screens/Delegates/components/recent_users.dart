/*import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

var Country = [
  "دمشق",
  "حلب",
  "حمص",
  "حماه",
  "القنيطرة",
  "السويداء",
  "اللاذقية",
  "طرطوس",
  "ريف دمشق",
  "الرقة",
  "الحسكة",
  "دير الزور",
  "ادلب"
];
var selectedcountry = "دمشق";
String selectedArea = "";

Map<String, List<String>> areasByProvince = {
  "دمشق": [
    "دمّر",
    "المزة",
    "كفرسوسة",
    "المهاجرين",
    "الصالحية",
    "ركن الدين",
    "برزة",
    "القابون",
    "جوبر",
    "ساروجة",
    "دمشق القديمة",
    "الشاغور",
    "الميدان",
    "القنوات",
    "الميدان",
    "الزاهرة",
    "اليرموك",
  ],
  "حلب": [
    "عفرين",
    "أعزاز",
    "الباب",
    "منبج",
    "السفيرة",
    "عين العرب",
    "جرابلس",
  ],
  "الرقة": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "حمص": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "حماه": [
    "الغاب",
    "محردة",
    "مصياف",
    "سلمية",
  ],
  "القنيطرة": [
    "خان أرنبة",
    "الكوم",
    "جباثا الخشب",
    "جبا",
    "مدينة البعث",
  ],
  "السويداء": [
    "شهبا",
    "صلخد",
  ],
  "اللاذقية": [
    "القرداحة",
    "الحفّة",
    "جبلة",
  ],
  "طرطوس": [
    "صافيتا",
    "دريكيش",
    "الشيخ بدر",
    "بانياس",
  ],
  "ريف دمشق": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "الحسكة": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "دير الزور": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "ادلب": ["منطقة 1", "منطقة 2", "منطقة 3"],
};
List<String>? selectedAreas = areasByProvince["دمشق"];

class ListOfDelegate extends StatefulWidget {
  const ListOfDelegate({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfDelegate> createState() => _ListOfDelegateState();
}

class _ListOfDelegateState extends State<ListOfDelegate> {
  Color statecolor = Colors.green;

  DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              TextAvatar(
                size: 35,
                backgroundColor: Colors.white,
                textColor: myblack,
                fontSize: 14,
                upperCase: true,
                numberLetters: 1,
                shape: Shape.Rectangle,
                text: userInfo.name!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  style: TextStyle(color: myblack),
                  userInfo.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(
          userInfo.ID!,
          style: TextStyle(color: myblack),
        )),
        DataCell(Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: getPlaceColor(userInfo.place).withOpacity(.2),
              border: Border.all(color: getPlaceColor(userInfo.place)),
              borderRadius: BorderRadius.all(Radius.circular(5.0) //
                  ),
            ),
            child: Text(
              userInfo.place!,
              style: TextStyle(color: myblack),
            ))),
        DataCell(Text(
          userInfo.email!,
          style: TextStyle(color: myblack),
        )),
        /*  DataCell(Text(
          userInfo.password!,
          style: TextStyle(color: myblack),
        )),
        DataCell(Text(
          userInfo.date!,
          style: TextStyle(color: myblack),
        )),*/
        DataCell(InkWell(
          onTap: () {
            setState(() {
              print(statecolor.toString());
              if (userInfo.state == true) {
                userInfo.state = false;
              } else {
                userInfo.state = true;
              }
              print(statecolor.toString());
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: userInfo.state == true
                    ? Colors.green.withOpacity(.2)
                    : Colors.red.withOpacity(.2),
                border: Border.all(
                  color: userInfo.state == true ? Colors.green : Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0) //
                    ),
              ),
              child: Text(
                userInfo.state == true ? "Activ" : "NonActiv",
                style: TextStyle(color: myblack),
              )),
        )),

        /* DataCell(Text(
        userInfo.posts!,
        style: TextStyle(color: myblack),
      )),
   */

        DataCell(
          DropdownButtonFormField<String>(
            value: selectedcountry,
            onChanged: (newValue) {
              setState(() {
                selectedcountry = newValue!;
                selectedAreas = areasByProvince[selectedcountry]!;
                selectedArea =
                    selectedAreas!.isNotEmpty ? selectedAreas![0] : "";
              });
            },
            items: Country.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Cario",
                    fontSize: 15,
                  ),
                ),
              );
            }).toList(),
            borderRadius: BorderRadius.circular(20.0),
            dropdownColor: Color.fromARGB(255, 255, 255, 255),
            decoration: InputDecoration(
              border: InputBorder.none, // حذف الخط تحت المربع
            ),
          ),
        ),
        DataCell(
          DropdownButtonFormField<String>(
            value: selectedArea.isNotEmpty ? selectedArea : null,
            onChanged: (newValue) {
              setState(() {
                selectedArea = newValue!;
              });
            },
            items: selectedAreas?.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            borderRadius: BorderRadius.circular(20.0),
            iconEnabledColor: Color.fromARGB(255, 43, 51, 147),
            dropdownColor: Color.fromARGB(255, 255, 255, 255),
            decoration: InputDecoration(
              border: InputBorder.none, // حذف الخط تحت المربع
              labelText: 'المنطقة',
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              TextButton(
                child: Text('View', style: TextStyle(color: greenColor)),
                onPressed: () {},
              ),
              SizedBox(
                width: 6,
              ),
              TextButton(
                child:
                    Text("Delete", style: TextStyle(color: Colors.redAccent)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.warning_outlined,
                                      size: 36, color: Colors.red),
                                  SizedBox(height: 20),
                                  Text("Confirm Deletion"),
                                ],
                              ),
                            ),
                            content: Container(
                              color: secondaryColor,
                              // color: bgColor,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      "Are you sure want to delete '${userInfo.name}'?"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.close,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.grey),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          label: Text("Cancel")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () {},
                                          label: Text("Delete"))
                                    ],
                                  )
                                ],
                              ),
                            ));
                      });
                },
                // Delete
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
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
        //color: secondaryColor,
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Candidates",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  /*DataColumn(
                    label: Text(
                      "Name",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "ID",
                      style: TextStyle(color: myblack),
                    ),
                  ),*/
                  DataColumn(
                    label: Text(
                      "Applied Position",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "E-mail",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Password",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Registration Date",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Status",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "test",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "test",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Operation",
                      style: TextStyle(color: myblack),
                    ),
                  ),
                ],
                rows: List.generate(
                  recentUsers.length,
                  (index) => recentUserDataRow(recentUsers[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';

class RecentUser {
  String? name;
  String? ID;
  String? place;
  String? email;
  String? password;
  String? date;
  bool state;
  String? province;
  String? area;

  RecentUser({
    this.name,
    this.ID,
    this.place,
    this.email,
    this.password,
    this.date,
    required this.state,
    this.province,
    this.area,
  });
}

List<RecentUser> recentUsers = [
  RecentUser(
    name: "ll",
    ID: "123456",
    place: "القنيطرة",
    email: "john.doe@example.com",
    password: "password123",
    date: "2024-06-04",
    state: true,
    province: "دمشق",
    area: "دمّر",
  ),
  RecentUser(
    name: "nj",
    ID: "123457",
    place: "دمشق",
    email: "john.doe@example.com",
    password: "password123",
    date: "2024-06-04",
    state: true,
    province: "القنيطرة",
    area: "خان أرنبة",
  ),
  RecentUser(
    name: "nj",
    ID: "123457",
    place: "دمشق",
    email: "john.doe@example.com",
    password: "password123",
    date: "2024-06-04",
    state: true,
    province: "القنيطرة",
    area: "خان أرنبة",
  ),
];

var Country = [
  "بلا",
  "دمشق",
  "حلب",
  "حمص",
  "حماه",
  "القنيطرة",
  "درعا",
  "السويداء",
  "اللاذقية",
  "طرطوس",
  "ريف دمشق",
  "الرقة",
  "الحسكة",
  "دير الزور",
  "ادلب"
];

Map<String, List<String>> areasByProvince = {
  "بلا": [
    "بلا",
  ],
  "دمشق": [
    "دمّر",
    "المزة",
    "كفرسوسة",
    "المهاجرين",
    "الصالحية",
    "ركن الدين",
    "برزة",
    "القابون",
    "جوبر",
    "ساروجة",
    "دمشق القديمة",
    "الشاغور",
    "الميدان",
    "القنوات",
    "الميدان",
    "الزاهرة",
    "اليرموك",
  ],
  "حلب": [
    "عفرين",
    "أعزاز",
    "الباب",
    "منبج",
    "السفيرة",
    "عين العرب",
    "جرابلس",
  ],
  "الرقة": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "حمص": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "حماه": [
    "الغاب",
    "محردة",
    "مصياف",
    "سلمية",
  ],
  "القنيطرة": [
    "خان أرنبة",
    "الكوم",
    "جباثا الخشب",
    "جبا",
    "مدينة البعث",
  ],
  "درعا": [
    "إنخل",
    "درعا البلد",
    "جاسم",
    "نوى",
    "طفس",
  ],
  "السويداء": [
    "شهبا",
    "صلخد",
  ],
  "اللاذقية": [
    "القرداحة",
    "الحفّة",
    "جبلة",
  ],
  "طرطوس": [
    "صافيتا",
    "دريكيش",
    "الشيخ بدر",
    "بانياس",
  ],
  "ريف دمشق": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "الحسكة": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "دير الزور": ["منطقة 1", "منطقة 2", "منطقة 3"],
  "ادلب": ["منطقة 1", "منطقة 2", "منطقة 3"],
};

class ListOfDelegate extends StatefulWidget {
  const ListOfDelegate({Key? key}) : super(key: key);

  @override
  State<ListOfDelegate> createState() => _ListOfDelegateState();
}

class _ListOfDelegateState extends State<ListOfDelegate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
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
        //color: secondaryColor,
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Candidates",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: 8,
                columns: [
                  DataColumn(
                    label: Text(
                      "Name",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "ID",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Applied Position",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "E-mail",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Status",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Province",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Area",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Operation",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
                rows: List.generate(
                  recentUsers.length,
                  (index) => recentUserDataRow(recentUsers[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              TextAvatar(
                size: 35,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 14,
                //  upperCase: true,
                numberLetters: 1,
                shape: Shape.Rectangle,
                text: userInfo.name!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  userInfo.name!,
                  style: TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(
          userInfo.ID!,
          style: TextStyle(color: Colors.black),
        )),
        DataCell(Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: getPlaceColor(userInfo.province).withOpacity(.2),
              // Colors.white.withOpacity(.2),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Text(
              userInfo.province!,
              style: TextStyle(color: Colors.black),
            ))),
        DataCell(Text(
          userInfo.email!,
          style: TextStyle(color: Colors.black),
        )),
        DataCell(InkWell(
          onTap: () {
            setState(() {
              userInfo.state = !userInfo.state;
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: userInfo.state
                    ? Colors.green.withOpacity(.2)
                    : Colors.red.withOpacity(.2),
                border: Border.all(
                  color: userInfo.state ? Colors.green : Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Text(
                userInfo.state ? "Activ" : "NonActiv",
                style: TextStyle(color: Colors.black),
              )),
        )),
        DataCell(
          DropdownButtonFormField<String>(
            value: userInfo.province,
            onChanged: (newValue) {
              setState(() {
                userInfo.province = newValue!;
                if (areasByProvince.containsKey(newValue)) {
                  userInfo.area = areasByProvince[newValue]!.isNotEmpty
                      ? areasByProvince[newValue]![0]
                      : "";
                } else {
                  userInfo.area = "";
                }
              });
            },
            items: Country.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Cario",
                    fontSize: 15,
                  ),
                ),
              );
            }).toList(),
            borderRadius: BorderRadius.circular(20.0),
            dropdownColor: Color.fromARGB(255, 255, 255, 255),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        DataCell(
          DropdownButtonFormField<String>(
            value: userInfo.area,
            onChanged: (newValue) {
              setState(() {
                userInfo.area = newValue!;
              });
            },
            items: areasByProvince[userInfo.province]?.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            borderRadius: BorderRadius.circular(20.0),
            iconEnabledColor: Color.fromARGB(255, 43, 51, 147),
            dropdownColor: Color.fromARGB(255, 255, 255, 255),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              TextButton(
                child: Text('View', style: TextStyle(color: greenColor)),
                onPressed: () {},
              ),
              SizedBox(
                width: 6,
              ),
              TextButton(
                child:
                    Text("Delete", style: TextStyle(color: Colors.redAccent)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.warning_outlined,
                                      size: 36, color: Colors.red),
                                  SizedBox(height: 20),
                                  Text("Confirm Deletion"),
                                ],
                              ),
                            ),
                            content: Container(
                              color: secondaryColor,
                              // color: bgColor,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      "Are you sure want to delete '${userInfo.name}'?"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.close,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.grey),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          label: Text("Cancel")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton.icon(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () {},
                                          label: Text("Delete"))
                                    ],
                                  )
                                ],
                              ),
                            ));
                      });
                },
                // Delete
              ),
            ],
          ),
        ),
      ],
    );
  }
}
