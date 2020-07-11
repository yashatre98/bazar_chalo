import 'package:bazarchalo/constants.dart';
import 'package:bazarchalo/my_buttons.dart';
import 'package:flutter/material.dart';
import 'Register_page.dart';
import 'Forgot_password.dart';

class CustomerLogin extends StatefulWidget {
  @override
  _CustomerLoginState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Customer Login/Signup',style: ts_normal,),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //margin: EdgeInsets.only(top: 250),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(143, 148, 251,.2),
                      blurRadius: 10,
                      offset: Offset(0,10),
                    ),],
                  ),
                  child: TextField(
                    style: ts_normal.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter Email or Phone number",
                      hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //margin: EdgeInsets.only(top: 250),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(143, 148, 251,.3),
                      blurRadius: 10,
                      offset: Offset(0,10),
                    ),],
                  ),
                  child: TextField(
                    style: ts_normal.copyWith(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 30,
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
                        'Login',
                        style: ts_big.copyWith(color: Colors.black)
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                  child: Center(child: Text('Or',style: ts_normal.copyWith(fontSize: 15,),),),
                ),
                round_rectangle_button(
                  press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  Register();
                    }),);
                  },
                  rec_child: Text('Register',style: ts_normal,),
                ),
                SizedBox(
                  height: 140,
                ),
                round_rectangle_button(
                  press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  ForgotPassword();
                    }),);
                  },
                  rec_child: Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
