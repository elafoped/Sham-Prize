import 'package:flutter/material.dart';

const double defaultPadding = 16.0;
const Color primaryColor = Colors.blue;
const Color bgColor = Colors.white;
const Color myblack = Colors.black;

class TargetMonthMiniCard extends StatefulWidget {
  final Color color;
  final String title;
  final int currentSales;
  final int targetSales;
  final Function(String) onTitleChanged;
  final Function(int) onTargetChanged;
  final bool isEditing;

  const TargetMonthMiniCard({
    Key? key,
    required this.color,
    required this.title,
    required this.currentSales,
    required this.targetSales,
    required this.onTitleChanged,
    required this.onTargetChanged,
    required this.isEditing,
  }) : super(key: key);

  @override
  _TargetMonthMiniCardState createState() => _TargetMonthMiniCardState();
}

class _TargetMonthMiniCardState extends State<TargetMonthMiniCard> {
  late TextEditingController _titleController;
  late TextEditingController _targetController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _targetController = TextEditingController(text: widget.targetSales.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = widget.currentSales / widget.targetSales;
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Container(
                  color: widget.color,
                ),
              ),
              SizedBox(width: defaultPadding),
              widget.isEditing
                  ? Expanded(
                      child: TextField(
                        controller: _titleController,
                        onChanged: widget.onTitleChanged,
                        style: TextStyle(color: myblack),
                        decoration: InputDecoration(
                          hintText: "Product Title",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  : Text(
                      widget.title,
                      style: TextStyle(color: myblack),
                    ),
            ],
          ),
          SizedBox(height: defaultPadding),
          LinearProgressIndicator(
            value: progress,
            color: widget.color,
            backgroundColor: widget.color.withOpacity(0.2),
          ),
          SizedBox(height: defaultPadding),
          Text(
            '${widget.currentSales} / ${widget.targetSales}',
            style: TextStyle(color: myblack),
          ),
          Text(
            '+ ${(progress * 100).toStringAsFixed(1)}%',
            style: TextStyle(color: myblack),
          ),
          SizedBox(height: defaultPadding),
          widget.isEditing
              ? TextField(
                  controller: _targetController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    widget.onTargetChanged(int.tryParse(value) ?? widget.targetSales);
                  },
                  style: TextStyle(color: myblack),
                  decoration: InputDecoration(
                    hintText: "Target Sales",
                    border: InputBorder.none,
                  ),
                )
              : Text(
                  'Target: ${widget.targetSales}',
                  style: TextStyle(color: myblack),
                ),
        ],
      ),
    );
  }
}
