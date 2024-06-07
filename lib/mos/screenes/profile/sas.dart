import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_admin_dashboard/mos/utilites/utilites.dart';

import '../../widget/Calendar.dart';
import 'package:smart_admin_dashboard/mos/widget/Calendar.dart';

class Profile extends StatefulWidget {
  static const String route = "/home";
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  TextEditingController _textFieldController = TextEditingController(text: " Moustafa harb");
  TextEditingController _FTextFieldController = TextEditingController(text: " 0937599542 ");
  TextEditingController _STextFieldController = TextEditingController(text: "qiwciwqcqcmqcm  ");
  TextEditingController _TTextFieldController = TextEditingController(text: "  cmkamcmmca");
  TextEditingController _VTextFieldController = TextEditingController(text: "  diemaiomcae");
  TextEditingController _XTextFieldController = TextEditingController(text: "   ");
  DateTime _selectedDate = DateTime.now();
  bool _isEditing = false;
  Uint8List? _profileImageBytes;
  void _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _profileImageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double height = constraints.maxHeight;
      double width = constraints.maxWidth;

      double fontSize = width * 0.013;
      double iconSize = width * 0.013;
      double imageSize = width * 0.037;

      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _topSection(fontSize, iconSize, imageSize, width),
              Container(
                height: height * 0.9,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white54,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: height * 0.01,
                              start: width * 0.015,
                              end: width * 0.001,
                              bottom: height * 0.02,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(height * 0.01),
                                  child: Container(
                                    height: height * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45),
                                      border: Border.all(color: seccanderColor, width: 4),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: height * 0.02,
                                        left: width * 0.025,
                                        right: width * 0.001,
                                        bottom: height * 0.0012,
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.only(start: width * 0.25, top: height * 0.017),
                                                  child: Text(
                                                    " Personal details ",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.5,
                                                      color: mainColor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.only(
                                                    start: width * 0.02,
                                                    top: height * 0.01,
                                                  ),
                                                  child: IconButton(
                                                    focusColor: Colors.black87,
                                                    color: Colors.indigoAccent,
                                                    isSelected: true,
                                                    onPressed: () {
                                                      setState(() {
                                                        _isEditing = !_isEditing;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.mode_edit_outlined,
                                                      color: Colors.black87.withOpacity(0.7),
                                                      size: iconSize * 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.black,
                                              indent: width * 0.2,
                                              endIndent: width * 0.15,
                                              thickness: 3,
                                            ),
                                            SizedBox(height: width * 0.02),
                                            _buildTextField("Name:", _textFieldController, _isEditing, fontSize, width, height),
                                            _buildTextField("Contact no :", _FTextFieldController, _isEditing, fontSize, width, height),
                                            _buildTextField("Email:", _STextFieldController, _isEditing, fontSize, width, height),
                                            _buildTextField("Password:", _TTextFieldController, _isEditing, fontSize, width, height),
                                            _buildTextField("Category:", _VTextFieldController, _isEditing, fontSize, width, height),
                                            SizedBox(height: width * 0.015),
                                            _buildTextField("Bio :", _XTextFieldController, _isEditing, fontSize, width, height),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                            height: width * 0.20,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: mainColor,
                              border: Border.all(color: seccanderColor, width: 2.5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(height * 0.013),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: seccanderColor, width: 3),
                                ),
                                child: Center(
                                  child: _profileImageBytes != null
                                      ? ClipOval(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: kIsWeb
                                        ? Image.memory(
                                      _profileImageBytes!,
                                      fit: BoxFit.cover,
                                      width: height * 0.3,
                                      height: height * 0.3,
                                    )
                                        : Image.file(
                                      File.fromRawPath(_profileImageBytes!),
                                      fit: BoxFit.cover,
                                      width: width * 0.6,
                                      height: width * 0.6,
                                    ),
                                  )
                                      : GestureDetector(
                                    onTap: () {
                                      _pickImage(context);
                                    },
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: fontSize * 2.5,
                                      color: seccanderColor.withOpacity(.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Adding the second icon to the left side
                           Positioned(
                            right: height*0.01, // adjust as needed
                            bottom: width*0.01,  // adjust as needed
                            child: GestureDetector(
                              child:IconButton(icon:
                                 Icon(
                                  Icons.photo_filter, // Choose the icon you want
                                  size: fontSize * 2.5,
                                  color: CupertinoColors.white.withOpacity(0.7),
                                ),
                                onPressed: (){
                                  _pickImage(context);
                                },
                                color: Colors.white60,
                                isSelected: true,
                                hoverColor: seccanderColor,
                                mouseCursor:MouseCursor.uncontrolled,

                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _topSection(double fontSize, double iconSize, double imageSize, double width) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle_sharp, color: mainColor, size: iconSize * 2.75),
                  Text(
                    " Profile",
                    style: TextStyle(
                      fontSize: fontSize * 2,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(flex: 2),
          Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: width * 0.01),
                      child: Text(
                        "Today : ${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day} ",
                        style: TextStyle(
                          fontSize: fontSize * 0.9,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: width * 0.01),
                      child: IconButton(
                        icon: Icon(
                          Icons.calendar_month,
                          color: mainColor,
                          size: iconSize * 2,
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
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool isEditing, double fontSize, double width, double height) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: height * 0.001, horizontal: width * 0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.10, // Adjust width as needed
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize * 1.25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: width * 0.02,
                end: width * 0.02,
                top: height * 0.01,
                bottom: height * 0.01,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 3,
                  controller: controller,
                  enabled: isEditing,
                  
                  style: TextStyle(fontSize: fontSize, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.04),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
