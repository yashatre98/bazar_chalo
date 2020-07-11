import 'package:bazarchalo/constants.dart';
import 'package:bazarchalo/my_buttons.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forgot Password',
            style: ts_normal,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Card(
                  child: TextField(
                    style: ts_normal.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter Email or Phone number",
                      hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                    //obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                round_rectangle_button(
                  w: 120,
                  h:40,
                  button_color: Colors.teal,
                  press:(){},
                  rec_child: Text('Send OTP',style: ts_normal,),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: TextField(
                    style: ts_normal.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter Verification Code sent to Email or phone number",
                      hintStyle: ts_normal.copyWith(fontSize: 10,color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                    //obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: TextField(
                    style: ts_normal.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter new Password",
                      hintStyle: ts_normal.copyWith(fontSize: 10,color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: TextField(
                    style: ts_normal.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Confirm new Password",
                      hintStyle: ts_normal.copyWith(fontSize: 10,color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                          'Submit',
                          style: ts_big.copyWith(fontSize:25,color: Colors.black)
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
