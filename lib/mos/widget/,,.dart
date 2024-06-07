/*Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white54,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.only(top:height*0.02,left: width*0.025,right: width*0.001,bottom: height*0.0012 ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(height*0.01),
                                  child: Container(
                                    height: height * 0.65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black, width: 3), // Adding black border
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(top:height*0.02,left: width*0.025,right: width*0.001,bottom: height*0.0012 ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.25,top: height*0.017),
                                                  child: Text(
                                                    "Personal details",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.5,
                                                      color: mainColor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.02,top: height*0.01),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _isEditing = !_isEditing;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.mode_edit_outlined,
                                                      color: Colors.black87,
                                                      size: iconSize * 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.black,
                                              indent: width*0.2,
                                              endIndent: width*0.14,
                                              thickness: 3,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.01,bottom: height*0.001,right: width*0.01,top: height*0.001),
                                                  child: Text(
                                                    "Name :",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.25, // Adjust as necessary
                                                      fontWeight: FontWeight.bold,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(

                                                  child: TextField(
                                                    controller: _textFieldController,
                                                    obscureText: false,
                                                    enabled: _isEditing,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: fontSize * 1,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter text here",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.01,bottom: height*0.001,right: width*0.01,top: height*0.001),
                                                  child: Text(
                                                    "Contact no :",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.25, // Adjust as necessary
                                                      fontWeight: FontWeight.bold,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    controller: _FTextFieldController,
                                                    obscureText: false,
                                                    enabled: _isEditing,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: fontSize * 1,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter text here",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.01,bottom: height*0.001,right: width*0.01,top: height*0.001),
                                                  child: Text(
                                                    "Email :",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.25, // Adjust as necessary
                                                      fontWeight: FontWeight.bold,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    controller: _STextFieldController,
                                                    obscureText: false,
                                                    enabled: _isEditing,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: fontSize * 1,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter text here",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.01,bottom: height*0.001,right: width*0.01,top: height*0.001),

                                                  child: Text(
                                                    "Password :",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.25, // Adjust as necessary
                                                      fontWeight: FontWeight.bold,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    controller: _TTextFieldController,
                                                    obscureText: false,
                                                    enabled: _isEditing,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: fontSize * 1,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter text here",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.01,bottom: height*0.001,right: width*0.01,top: height*0.001),

                                                  child: Text(
                                                    "Category :      ",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.25, // Adjust as necessary
                                                      fontWeight: FontWeight.bold,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    controller: _VTextFieldController,
                                                    obscureText: false,
                                                    enabled: _isEditing,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: fontSize * 1,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter text here",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: width*0.01,bottom: height*0.001,right: width*0.01,top: height*0.0),

                                                  child: Text(
                                                    "Bio :",
                                                    style: TextStyle(
                                                      fontSize: fontSize * 1.25, // Adjust as necessary
                                                      fontWeight: FontWeight.bold,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    controller: _XTextFieldController,
                                                    obscureText: false,
                                                    enabled: _isEditing,
                                                    maxLines: 3,
                                                    minLines:1 ,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: fontSize * 1,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter text here",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                    */