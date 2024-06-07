import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/mos/HomePage.dart';
import 'package:smart_admin_dashboard/mos/screenes/Register/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  TextEditingController _firstTextFieldController = TextEditingController();
  TextEditingController _secondTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff161B3B),
        child: Center(
          child:  Container(
              width: MediaQuery.of(context).size.width/ 1.5,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xff384E86),
                    Color(0xff384E86),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40,top: 40),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          "Welcome Back ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        ".",
                        style: TextStyle(color: Colors.blue, fontSize: 50,
                        fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.005),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width *0.35,

                      child: _buildInputField(
                        hintText: 'Name of your company',
                        controller: _secondTextFieldController,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.040),
                  Padding(
                    padding: const EdgeInsets.only(left:40,),
                    child: Container(
                      width: MediaQuery.of(context).size.width *0.35,
                      child: _buildInputField(
                        hintText: 'Password',
                        controller: _firstTextFieldController,
                        isPassword: true,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.025),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }

  Widget _buildInputField({
    required String hintText,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff344366),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
