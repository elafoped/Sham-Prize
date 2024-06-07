
import 'package:flutter/material.dart';

import '../../../screens/login/login_screen.dart';
import '../../widget/Tbutton.dart';
import '../Login _screen/Login.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstTextFieldController = TextEditingController();
  TextEditingController _secondTextFieldController = TextEditingController();
  TextEditingController _thirdTextFieldController = TextEditingController();
  TextEditingController _fourthTextFieldController = TextEditingController();
  TextEditingController _fifthTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xff161B3B),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.30,
            height: MediaQuery.of(context).size.height / 1.65,


            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff384E86),
                  Color(0xff384E86),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "START FOR FREE ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.012,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Create new account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.028,
                        ),
                      ),
                      Text(
                        ".",
                        style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.032),
                      )
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.025),
                  Row(
                    children: [
                      Container(
                        width: screenWidth / 6,
                        decoration: BoxDecoration(
                          color: Color(0xff344366),
                          borderRadius: BorderRadius.circular(screenWidth * 0.015),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            controller: _firstTextFieldController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name of your company',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.012),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.015),
                      Container(
                        width: screenWidth / 6,
                        decoration: BoxDecoration(
                          color: Color(0xff344366),
                          borderRadius: BorderRadius.circular(screenWidth * 0.015),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            controller: _secondTextFieldController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Commercial Record',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.012),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.015),
                  Container(
                    width: screenWidth / 3.5,
                    decoration: BoxDecoration(
                      color: Color(0xff344366),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _thirdTextFieldController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email for Your Company ',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.012),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.020),
                  Container(
                    width: screenWidth / 2.85,
                    decoration: BoxDecoration(
                      color: Color(0xff344366),
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        controller: _fourthTextFieldController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password ',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.012),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.020),
                  Container(
                    width: screenWidth / 3,
                    decoration: BoxDecoration(
                      color: Color(0xff344366),
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        controller: _fifthTextFieldController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password ',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.012),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.018),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.24,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform registration here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: screenWidth * 0.010, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: screenWidth * 0.15,),
                      Text("Already A Member..?",style:TextStyle(color: Colors.white),),
                      InkWell(
                        child: Tbutton(
                          Colors.redAccent, "login",
                              () {
                             //      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
                          },
                        ),),],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
