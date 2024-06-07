import 'package:flutter/material.dart';

class Tbutton extends StatefulWidget {
  Color color;
  String titel;
  Function onTap;
  Tbutton(this.color,this.titel,this.onTap);
  @override
  State<Tbutton> createState() => _TbuttonState();
}

class _TbuttonState extends State<Tbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:widget.onTap(), child: Text(widget.titel,style: TextStyle(color: widget.color),
    ));

  }
}
