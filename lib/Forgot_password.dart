import 'package:bazarchalo/constants.dart';
import 'package:bazarchalo/my_buttons.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _formkey1 = GlobalKey<FormState>();
  var _formkey2 = GlobalKey<FormState>();
  String _confirm = "";
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
                Form(
                  key: _formkey1,
                  child: Card(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        if (value.isEmpty)
                          return "Please enter the phone number";
                        if (value.length != 10)
                          return "Phone number not correct";
                        if (!value.contains(new RegExp(r'^[0-9]')))
                          return "Phone number should be numeric";
                      },
                      style: ts_normal.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Enter Phone number",
                        errorStyle:
                            ts_small.copyWith(color: Colors.yellowAccent),
                        errorMaxLines: 2,
                        hintStyle: ts_normal.copyWith(
                            fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                      //obscureText: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                round_rectangle_button(
                  w: 120,
                  h: 40,
                  button_color: Colors.teal,
                  press: () {
                    if (_formkey1.currentState.validate()) setState(() {});
                  },
                  rec_child: Text(
                    'Send OTP',
                    style: ts_normal,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formkey2,
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            if (value.isEmpty) return "OTP not entered";
                            if (value.length != 6) return "OTP has 6 digits";
                            if (!value.contains(new RegExp(r'^[0-9]')))
                              return "OTP should be numeric"; 
                          },
                          style: ts_normal.copyWith(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter verification code sent to phone",
                            errorStyle:
                                ts_small.copyWith(color: Colors.yellowAccent),
                            errorMaxLines: 3,
                            hintStyle: ts_normal.copyWith(
                                fontSize: 10, color: Colors.grey),
                            border: OutlineInputBorder(),
                          ),
                          //obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: TextFormField(
                          validator: (String value) {
                            _confirm = value;
                            if (value.isEmpty)
                              return "please enter the password";
                            if (value.length < 8)
                              return "passwords are 8-20 characters long";
                            if (value.length > 20)
                              return "passwords are 8-20 characters long";
                            if (!value.contains(new RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')))
                              return "passwords have atleast one upper, one lower case, one digit, and special characters";
                          },
                          style: ts_normal.copyWith(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter new Password",
                            errorStyle:
                                ts_small.copyWith(color: Colors.yellowAccent),
                            errorMaxLines: 3,
                            hintStyle: ts_normal.copyWith(
                                fontSize: 10, color: Colors.grey),
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: TextFormField(
                          validator: (String value) {
                            if (!(value == _confirm))
                              return "password do not match";
                          },
                          style: ts_normal.copyWith(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Confirm new Password",
                            errorStyle:
                                ts_small.copyWith(color: Colors.yellowAccent),
                            errorMaxLines: 3,
                            hintStyle: ts_normal.copyWith(
                                fontSize: 10, color: Colors.grey),
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey2.currentState.validate()) setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Submit',
                          style:
                              ts_big.copyWith(fontSize: 25, color: Colors.black)
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
