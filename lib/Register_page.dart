import 'package:bazarchalo/constants.dart';
import 'package:bazarchalo/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'ShopRegistration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_otp/flutter_otp.dart';
import 'location.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'dart:core';
//import 'dart:convert';

enum AccountType { consumer, owner }
int group = 1;
AccountType _character = AccountType.consumer;

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formkey1 = GlobalKey<FormState>();
  var _formkey2 = GlobalKey<FormState>();
  final pnController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  final passwdController = TextEditingController();

  String button = "Submit";
  String _confirm = "";
  String location = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Registrations',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Radio(
                        value: 1,
                        groupValue: group,
                        onChanged: (val) {
                          setState(() {
                            group = val;
                            button = "Submit";
                          });
                        }),
                    Text(
                      'Consumer',
                      style: ts_normal,
                    ),
                    Radio(
                        value: 2,
                        groupValue: group,
                        onChanged: (val) {
                          setState(() {
                            group = val;
                            button = "Next";
                          });
                        }),
                    Text(
                      'Owner',
                      style: ts_normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formkey1,
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.phone,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      title: TextFormField(
                        controller: pnController,
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty)
                            return "Please enter the phone number";
                          if (value.length != 10)
                            return "Phone number not correct";
                          if (!value.contains(new RegExp(r'^[0-9]+$')))
                            return "Phone number should be numeric";
                        },
                        style: ts_normal.copyWith(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter Phone number",
                          hintStyle: ts_normal.copyWith(
                              fontSize: 13, color: Colors.grey),
                          border: OutlineInputBorder(),
                          errorStyle:
                          ts_small.copyWith(color: Colors.yellowAccent),
                        ),
                        //obscureText: true,
                      ),
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
                    if (_formkey1.currentState.validate())
                      setState(() {
                        //sendOtp('8770443479');
                      });
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
                        elevation: 10,
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.receipt,
                              size: 40, color: Colors.greenAccent),
                          title: TextFormField(
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            validator: (String value) {
                              if (value.isEmpty) return "OTP not entered";
                              if (value.length != 6) return "OTP has 6 digits";
                              if (!value.contains(new RegExp(r'^[0-9]')))
                                return "OTP should be numeric";
                            },
                            style: ts_normal.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText:
                              "Enter Verification Code sent to your phone number",
                              hintStyle: ts_normal.copyWith(
                                  fontSize: 10, color: Colors.grey),
                              border: OutlineInputBorder(),
                              errorStyle:
                              ts_small.copyWith(color: Colors.yellowAccent),
                            ),
                            //obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        elevation: 10,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.userAlt,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                          title: TextFormField(
                            controller: nameController,
                            validator: (String value) {
                              if (value.isEmpty) return "Name not Entered";
                              if (value.length <= 3)
                                return "Name should be more than 3 characters.";
                              if (value.length > 20)
                                return "name should be less than 20 characters";
                              if (!value.contains(new RegExp(
                                  r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$')))
                                return "can have upper and lower case, '_', '-', and 3 to 20 characters long";
                            },
                            style: ts_normal.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter User Name",
                              errorStyle:
                              ts_small.copyWith(color: Colors.yellowAccent),
                              hintStyle: ts_normal.copyWith(
                                  fontSize: 10, color: Colors.grey),
                              errorMaxLines: 3,
                              border: OutlineInputBorder(),
                            ),
                            //obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: TextFormField(
                          controller: passwdController,
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
                            hintText: "Create Password",
                            hintStyle: ts_normal.copyWith(
                                fontSize: 10, color: Colors.grey),
                            errorStyle:
                            ts_small.copyWith(color: Colors.yellowAccent),
                            errorMaxLines: 3,
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
                            hintText: "Confirm Password",
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
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //if (_formkey2.currentState.validate())
                      setState(
                            () {
                          if (group == 2)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ShopRegistration();
                                },
                              ),
                            );
                          else {
                            getCurrentLocation();
                            location =
                            "${position.latitude},${position.longitude}";
                            print(pnController.text);
                            print(location);
                            //GetConsumer();
                            postConsumer();
                          }
                        },
                      );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(button,
                          style:
                          ts_big.copyWith(fontSize: 22, color: Colors.black)
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

//
//  Future postConsumer() async {
//  var url = 'http://192.168.1.39:8080/consumer/add';
//  var response = await http.post(
//    url,
//    headers: {"Accept": "application/json"},
//    body: {
//      "name": "${nameController.text}",
//      "contactNumber": "${pnController.text}",
//      "password": "${passwdController.text}",
//      "location": location,
//    },
//  );
//  print('Response status: ${response.statusCode}');
//  print('Response body: ${response.body}');
//}
//}
//Future GetConsumer()async
//{
//  var url = 'http://localhost:8080/consumer/all';
//  var response = await http.get(url);
//
//  if (response.statusCode == 200) {
//    var jsonResponse = convert.jsonDecode(response.body);
//    //var itemCount = jsonResponse['totalItems'];
//    print(jsonResponse.toString());
//    //print('Number of books about http: $itemCount.');
//  } else {
//    print('Request failed with status: ${response.statusCode}.');
//  }
//  //print(jsonResponse.toString());
//}

//  print('Response Status Code: ${response.statusCode}');
//  print('Response body: ${response.body}');
  Future<dynamic> GetConsumer() async {
    String url = 'http://192.168.1.39:8080/consumer/all';
    final http.Response response = await http.Client().get(
      url,
    );

    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }
    print(response.body.toString());
  }

  Future<dynamic> postConsumer() async {
    String url = 'http://192.168.1.36:8080/consumer/add';
    final http.Response response = await http.Client().post(
      url,
      body: convert.jsonEncode({
        "name": nameController.text,
        "contactNumber": pnController.text,
        "password": passwdController.text,
        "location": location,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    try {
      //      final jsonResponse = json.decode(response.body);
//      return jsonResponse;
      print(response.body.toString());
    }

    catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
  }
}