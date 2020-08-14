//import 'dart:html';

import 'package:flutter/material.dart';
import 'main.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'ImageDisplay.dart';
import 'dart:io';


class ShopVerification extends StatefulWidget {
  @override
  _ShopVerificationState createState() => _ShopVerificationState();
}

class _ShopVerificationState extends State<ShopVerification> {

  List _image = List(12);
  final picker = ImagePicker();

  Future getImage1(BuildContext context,int i) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image[i] = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }
  Future getImage2(BuildContext context,int i) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image[i] = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context,int i)
  {
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Make a Choice',style: ts_normal,),
        backgroundColor: Color.fromARGB(255, 20, 18, 40),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
//              Text('Make a Choice',style: ts_normal,),
//              SizedBox(
//                height: 20,
//              ),
              GestureDetector(
                onTap: () {
                  getImage1(context,i);
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.mountain,size: 30,color: Colors.indigo,),
                          SizedBox(
                            width:5,
                          ),
                          Text('     Gallery',
                              style: ts_normal.copyWith(color: Colors.black)
                            //textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  getImage2(context,i);
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.camera,size: 30,color: Colors.indigo),
                          SizedBox(
                            width:5,
                          ),
                          Text('     Camera',
                              style: ts_normal.copyWith(color: Colors.black)
                            //textAlign: TextAlign.center,
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
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shop Verification photos',
            style: ts_normal,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  FontAwesomeIcons.camera,
                                  size: 25,
                                ),
                              ),
                              TextSpan(
                                text: "  Shop Pictures",
                                style: ts_normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.tealAccent,
                      ),
                      GridView.count(
                        padding: EdgeInsets.all(20),
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,0);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[0] == null ? Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ) : Image.file(_image[0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,1);
                            },
                            child: Container(
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              child: _image[1] == null ? Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ) : Image.file(_image[1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,2);
                              },
                            child: Container(
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              child: _image[2] == null ? Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ) : Image.file(_image[2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,3);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[3] == null ? Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ) : Image.file(_image[3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,4);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[4] == null ? Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ) : Image.file(_image[4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,5);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[5] == null ? Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ) : Image.file(_image[5]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    height: 3,
                    width: 300,
                    child: Divider(color: Colors.tealAccent),
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  FontAwesomeIcons.idCardAlt,
                                  size: 25,
                                ),
                              ),
                              TextSpan(
                                text: "  Required Documents",
                                style: ts_normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.tealAccent,
                      ),
                      GridView.count(
                        padding: EdgeInsets.all(20),
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,6);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[6] == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.deepPurpleAccent,
                                    size: 30,
                                  ),
                                  Text(
                                    "Owner's Picture",
                                    style:
                                    ts_small.copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ) : Image.file(_image[6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,7);
                            },
                            child: Container(
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              child: _image[7] == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.deepPurpleAccent,
                                    size: 30,
                                  ),
                                  Text(
                                    "Owner's Picture",
                                    style:
                                    ts_small.copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ) : Image.file(_image[7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,8);
                            },
                            child: Container(
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              child: _image[8] == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.deepPurpleAccent,
                                    size: 30,
                                  ),
                                  Text(
                                    "Owner's Picture",
                                    style:
                                    ts_small.copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ) : Image.file(_image[8]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,9);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[9] == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.deepPurpleAccent,
                                    size: 30,
                                  ),
                                  Text(
                                    "Owner's Picture",
                                    style:
                                    ts_small.copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ) : Image.file(_image[9]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,10);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[10] == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.deepPurpleAccent,
                                    size: 30,
                                  ),
                                  Text(
                                    "Owner's Picture",
                                    style:
                                    ts_small.copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ) : Image.file(_image[10]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showChoiceDialog(context,11);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlueAccent, width: 3),
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
                              //color: Colors.white,
                              child: _image[11] == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.deepPurpleAccent,
                                    size: 30,
                                  ),
                                  Text(
                                    "Owner's Picture",
                                    style:
                                    ts_small.copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ) : Image.file(_image[11]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                          style: ts_big.copyWith(fontSize:22,color: Colors.black)
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
