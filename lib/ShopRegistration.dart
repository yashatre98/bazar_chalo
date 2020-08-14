import 'package:flutter/material.dart';
import 'main.dart';
import 'constants.dart';
import 'package:image_picker/image_picker.dart';
import'package:font_awesome_flutter/font_awesome_flutter.dart';
import'package:bazarchalo/ShopVerification.dart';

class ShopRegistration extends StatefulWidget {
  @override
  _ShopRegistrationState createState() => _ShopRegistrationState();
}

class _ShopRegistrationState extends State<ShopRegistration> {

  var _shopRegKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Shop Registration",
            style: ts_normal,
          ),
        ),
        body: SingleChildScrollView(

          child: Center(
            child: Column(

              children: [
                Form(
                  key: _shopRegKey,
                  child: Column(

                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.shopify,
                          color: Colors.pinkAccent,
                            size: 40,
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (String value){
                              if(value.isEmpty)
                                return "Please enter the Shop name";
                              if(value.length<5)
                                return "Shop name must be more than 5 characters";
                              if(!value.contains(new RegExp(r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$')))
                                return "Shop name can have numbers, upper and lower case, '_', '-',space";
                            },
                            style: ts_normal.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter shop name",
                              hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                              border: OutlineInputBorder(),
                              errorStyle: ts_small.copyWith(color: Colors.yellowAccent),
                              errorMaxLines: 3,
                            ),
                            //obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: ListTile(
                          leading:Icon(FontAwesomeIcons.building,
                          color: Colors.yellowAccent,
                            size: 40,
                          ),
                          title: TextFormField(
                            minLines: 1,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            validator: (String value){
                              if(value.isEmpty)
                                return "Please enter the shop address";
                              if(value.length<5)
                                return "Shop name must be more than 5 characters";
                              if(!value.contains(new RegExp(r'^[A-Za-z0-9]+(?:[ _-\/][A-Za-z0-9]+)*$')))
                                return "Shop name can have numbers, upper and lower case, '_', '-',space";
                            },
                            style: ts_normal.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter shop Address",
                              hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                              border: OutlineInputBorder(),
                              errorStyle: ts_small.copyWith(color: Colors.yellowAccent),
                              errorMaxLines: 3,
                            ),
                            //obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.solidAddressCard,
                          color: Colors.deepOrangeAccent,
                              size:40,
                          ),
                          title: TextFormField(
                            minLines: 1,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            validator: (String value){
                              if(value.isEmpty)
                                return "Please enter the shop Contact Number";
                              if(value.length<5)
                                return "Shop name must be more than 5 characters";
                              if(!value.contains(new RegExp(r'^[A-Za-z0-9]+(?:[ _-\/][A-Za-z0-9]+)*$')))
                                return "Shop name can have numbers, upper and lower case, '_', '-',space";
                            },
                            style: ts_normal.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter shop Address",
                              hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                              border: OutlineInputBorder(),
                              errorStyle: ts_small.copyWith(color: Colors.yellowAccent),
                              errorMaxLines: 3,
                            ),
                            //obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.userCheck,
                            color: Colors.blueAccent,
                            size:40,
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.multiline,
                            validator: (String value){
                              if(value.isEmpty)
                                return "Please enter the shop Registration Number";
                            },
                            style: ts_normal.copyWith(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter shop Registration number",
                              hintStyle: ts_normal.copyWith(fontSize: 13,color: Colors.grey),
                              border: OutlineInputBorder(),
                              errorStyle: ts_small.copyWith(color: Colors.yellowAccent),
                              errorMaxLines: 3,
                            ),
                            //obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          //if(_shopRegKey.currentState.validate())
                            setState(() {
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return ShopVerification();
                              },),);
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
                            child: Text(
                                'Next',
                                style: ts_big.copyWith(fontSize:22,color: Colors.black)
                              //textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
