import 'package:bazarchalo/Location.dart';
import 'package:bazarchalo/constants.dart';
import 'package:bazarchalo/my_buttons.dart';
import 'package:flutter/material.dart';
import 'Register_page.dart';
import 'Forgot_password.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:bazarchalo/location.dart';

class CustomerLogin extends StatefulWidget {
  @override
  _CustomerLoginState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
//  final numberController = new TextEditingController();
//  final passwdController = TextEditingController();
//  String message = "";
  var _formkey = GlobalKey<FormState>();
  String location = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Customer Login/Signup',
            style: ts_normal,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    //margin: EdgeInsets.only(top: 250),
                    //height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        if (value.isEmpty)
                          return "please enter the Number";
                        if(value.length!=10)
                          return "numbers are 10 digit long";
                        if(!value.contains(new RegExp(r'^[0-9]*$')))
                          return "Not a Number";
                      },
                      style: ts_normal.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Enter Phone number",
                        hintStyle: ts_normal.copyWith(
                            fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(),
                        errorStyle: ts_small.copyWith(color: Colors.redAccent),
                        contentPadding: EdgeInsets.only(top: 3,bottom: 3,right: 3,left: 3),
                      ),
                    ),
                  ),
//                  Text(
//                    numberController.text,
//                    style: ts_small,
//                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    //margin: EdgeInsets.only(top: 250),
                    //height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .3),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) return "please enter the password";
                        if(value.length<8) return "passwords are 8-20 characters long";
                        if(value.length>20) return "passwords are 8-20 characters long";
                        if(!value.contains(new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$'))) return "passwords have atleast one upper, one lower case, one digit, and special characters";
                      },
                      //controller: passwdController,
                      style: ts_normal.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        errorMaxLines: 3,
                        contentPadding: EdgeInsets.only(top: 3,bottom: 3,right: 3,left: 3),
                        hintText: "Enter password",
                        hintStyle: ts_normal.copyWith(
                            fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(),
                        errorStyle: ts_small.copyWith(color: Colors.redAccent),
                      ),
                      obscureText: true,
                    ),
                  ),
//                  Text(
//                    //message,
//                    style: ts_small,
//                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState.validate()) setState(() {
                        getCurrentLocation();
                        location = "${position.latitude},${position.longitude}";
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Login',
                            style: ts_big.copyWith(color: Colors.black)
                            //textAlign: TextAlign.center,
                            ),
                      ),
                    ),
                  ),
                  Text(location),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: Text(
                        'Or',
                        style: ts_normal.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  round_rectangle_button(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Register();
                        }),
                      );
                    },
                    rec_child: Text(
                      'Register',
                      style: ts_normal,
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  round_rectangle_button(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ForgotPassword();
                        }),
                      );
                    },
                    rec_child: Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
