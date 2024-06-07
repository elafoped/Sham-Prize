import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/target_month_mini_card.dart';
import 'dart:math';

class TargetMonthWidget extends StatefulWidget {
  const TargetMonthWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TargetMonthWidgetState createState() => _TargetMonthWidgetState();
}

class _TargetMonthWidgetState extends State<TargetMonthWidget> {
  final List<Map<String, dynamic>> _targets = [
    {
      "color": Colors.blue,
      "title": 'Product A',
      "currentSales": 132,
      "targetSales": 200,
      "isEditing": false,
    },
    {
      "color": Colors.orange,
      "title": 'Product B',
      "currentSales": 100,
      "targetSales": 150,
      "isEditing": false,
    },
  ];

  Color getRandomColor() {
    Random random;
    random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _addTarget() {
    setState(() {
      _targets.add({
        "color": getRandomColor(),
        "title": 'New Product',
        "currentSales": 0,
        "targetSales": 100,
        "isEditing": true,
      });
    });
  }

  void _removeTarget(int index) {
    setState(() {
      _targets.removeAt(index);
    });
  }

  void _toggleEditing(int index) {
    setState(() {
      _targets[index]['isEditing'] = !_targets[index]['isEditing'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الأهداف الشهرية للمبيعات حسب الصنف",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 18,
              color: myblack,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _targets.length,
            itemBuilder: (context, index) {
              final target = _targets[index];
              return Column(
                children: [
                  TargetMonthMiniCard(
                    color: target['color'],
                    title: target['title'],
                    currentSales: target['currentSales'],
                    targetSales: target['targetSales'],
                    isEditing: target['isEditing'],
                    onTitleChanged: (newTitle) {
                      setState(() {
                        _targets[index]['title'] = newTitle;
                      });
                    },
                    onTargetChanged: (newTarget) {
                      setState(() {
                        _targets[index]['targetSales'] = newTarget;
                      });
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          target['isEditing'] ? Icons.save : Icons.edit,
                          color:
                              target['isEditing'] ? Colors.green : Colors.blue,
                        ),
                        onPressed: () => _toggleEditing(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeTarget(index),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: _addTarget,
            child: Text("إضافة هدف جديد"),
          ),
        ],
      ),
    );
  }
}
