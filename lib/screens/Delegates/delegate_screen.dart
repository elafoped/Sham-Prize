import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/Delegates/components/recent_users.dart';

import 'components/header.dart';

class DelegateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding + 10),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                  title: Center(
                                    child: Column(
                                      children: [
                                        Icon(Icons.add_moderator_sharp,
                                            size: 36,
                                            color: Color.fromARGB(
                                                255, 142, 144, 189)),
                                        SizedBox(height: 20),
                                        Text("Are You sure?"),
                                      ],
                                    ),
                                  ),
                                  content: Container(
                                    color: secondaryColor,
                                    // color: bgColor,
                                    height: 70,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                label: Text("No")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton.icon(
                                                icon: Icon(
                                                  Icons.delete,
                                                  size: 14,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 106, 104, 144)),
                                                onPressed: () {},
                                                label: Text("Yes"))
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                            });
                      },
                      child: Text('+Add One Account')),
                  SizedBox(width: defaultPadding),
                  TextButton(
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
                                        Text("Are you sure want to delete "),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                      child: Text('+Add Multi Account')),
                ],
              ),
              SizedBox(height: defaultPadding),
              ListOfDelegate(),
            ],
          ),
        ),
      ),
    );
  }
}
