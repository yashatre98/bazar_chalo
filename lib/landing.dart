import 'package:bazarchalo/customer_login.dart';
import 'package:bazarchalo/owner_login.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'my_buttons.dart';
import 'customer_login.dart';
import 'owner_login.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/app_icon.png'),
                  radius: 95,
                ),
              ),
              Text(
                'You are ?',
                style: ts_big_bold.copyWith(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  round_rectangle_button(
                    press: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CustomerLogin();
                      }),);
                    },
                    button_color: Colors.tealAccent,
                    w: 150,
                    h: 40,
                    rec_child: Text(
                      'Consumer',
                      style: ts_normal.copyWith(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 5,
                    child: VerticalDivider(
                      color: Colors.white,
                    ),
                  ),
                  round_rectangle_button(
                    press: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return OwnerLogin();
                      }),);
                    },
                    button_color: Colors.tealAccent,
                    w: 150,
                    h: 40,
                    rec_child: Text(
                      'Shop Owner',
                      style: ts_normal.copyWith(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  //FlatButton(onPressed: null, child: null)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
