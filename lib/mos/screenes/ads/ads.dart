import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_admin_dashboard/mos/utilites/utilites.dart';
import 'package:smart_admin_dashboard/mos/widget/Calendar.dart';

class Ads extends StatefulWidget {
  static const String route = "/Ads";
  Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> with SingleTickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();
  late TabController _tabController;
  File? _selectedImageFile;
  final TextEditingController _textController = TextEditingController();

  final List<Map<String, dynamic>> _posts1 = [
    {
      "image":
          "https://images.unsplash.com/photo-1535990379313-5cd271a2da2d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "text": "Post 1: Lorem ipsum dolor sit amet.",
      "likesCount": 0,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1535990379313-5cd271a2da2d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "text": "Post 2: Sed do eiusmod tempor incididunt.",
      "likesCount": 0,
    },
  ];

  final List<Map<String, dynamic>> _posts2 = [
    {
      "image":
          "https://images.unsplash.com/photo-1535990379313-5cd271a2da2d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "text": "Post 4: Duis aute irure dolor in reprehenderit.",
      "likesCount": 0,
    },
  ];

  final List<Map<String, dynamic>> _posts3 = [
    {
      "image":
          "https://images.unsplash.com/photo-1535990379313-5cd271a2da2d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "text": "Post 3: Lorem ipsum dolor sit amet.",
      "likesCount": 0,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1535990379313-5cd271a2da2d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "text": "Post 5: Consectetur adipiscing elit.",
      "likesCount": 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImageFile = File(pickedFile.path);
      });
    }
  }

  void _showAddPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add New Post',
            style: TextStyle(color: mainColor),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Enter post text",
                ),
              ),
              SizedBox(height: 10),
              _selectedImageFile != null
                  ? Image.file(
                      _selectedImageFile!,
                      height: 100,
                      width: 100,
                    )
                  : Container(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text(
                  'Pick Image',
                  style: TextStyle(color: mainColor),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: mainColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(color: mainColor),
              ),
              onPressed: () {
                setState(() {
                  _posts3.add({
                    "image": _selectedImageFile != null
                        ? _selectedImageFile!.path
                        : "https://images.unsplash.com/photo-1535990379313-5cd271a2da2d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "text": _textController.text,
                    "likesCount": 0,
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _topSection(
      double fontSize, double iconSize, double imageSize, double width) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white12,
        child: Row(
          children: [
            SizedBox(width: 15),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: imageSize,
                width: imageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(imageSize / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 8),
                      blurRadius: 15,
                    ),
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    alignment: AlignmentDirectional.center,
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Good Day",
                  style: TextStyle(
                    fontSize: fontSize * 1.20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  " almizan",
                  style: TextStyle(
                    fontSize: fontSize * 0.85,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
              ],
            ),
            Spacer(),
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
                            color: mainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: width * 0.01),
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
      ),
    );
  }

  Widget _buildPostsList(List<Map<String, dynamic>> posts, double fontSize,
      double height, double width) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(
          post: posts[index],
          fontSize: fontSize,
          height: height,
          width: width,
          onLike: () {
            setState(() {
              posts[index]["likesCount"] =
                  (posts[index]["likesCount"] ?? 0) + 1;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Liked Post ${index + 1}')),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double height = constraints.maxHeight;
      double width = constraints.maxWidth;

      double fontSize = width * 0.015;
      double iconSize = width * 0.013;
      double imageSize = width * 0.037;

      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _topSection(fontSize, iconSize, imageSize, width),
            Center(
              child: Container(
                color: Colors.white10,
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "News "),
                    Tab(text: "All Ads "),
                    Tab(text: "My Ads "),
                  ],
                  indicatorColor: Colors.red,
                  labelColor: seccanderColor,
                  unselectedLabelColor: mainColor,
                  splashBorderRadius: BorderRadius.circular(30),
                  labelStyle: TextStyle(
                    fontSize: fontSize * 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPostsList(_posts1, fontSize, height, width),
                  _buildPostsList(_posts2, fontSize, height, width),
                  _buildPostsList(_posts3, fontSize, height, width),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          splashColor: seccanderColor,
          onPressed: _showAddPostDialog,
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: mainColor,
        ),
      );
    });
  }
}

class PostItem extends StatelessWidget {
  final Map<String, dynamic> post;
  final double fontSize;
  final double height;
  final double width;
  final VoidCallback onLike;

  const PostItem({
    Key? key,
    required this.post,
    required this.fontSize,
    required this.height,
    required this.width,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: width * 0.03, vertical: height * 0.025),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: width * 0.025, vertical: height * 0.025),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
                      width: width * 0.05,
                      height: width * 0.05,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  Padding(
                    padding: EdgeInsetsDirectional.all(width * 0.004),
                    child: Column(
                      children: [
                        Text(
                          "SSS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize * 0.75,
                          ),
                        ),
                        Text(
                          " ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day} ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize * 0.75,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(width * 0.01),
                      child: Text(
                        post["text"],
                        style: TextStyle(
                          fontSize: fontSize * 1.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: width * 0.35,
                    height: height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    /* child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: post["image"],
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.black,),
                        fit: BoxFit.cover,
                      ),
                    ),*/
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up, color: Colors.black87),
                    onPressed: onLike,
                  ),
                  Text(
                    '${(post["likesCount"] ?? 0).toString()} Likes',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
