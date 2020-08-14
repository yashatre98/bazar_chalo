import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'package:image_picker/image_picker.dart';

class ImageDisplay extends StatefulWidget {
  @override
  _ImageDisplayState createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {

  _openGallery(){

  }
  _openCamera(){

  }

  Future<void> showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _openGallery();
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.memory),
                        SizedBox(
                          width:5,
                        ),
                        Text('Gallery',
                            style: ts_big.copyWith(color: Colors.black)
                          //textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _openCamera();
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.camera),
                        SizedBox(
                          width:5,
                        ),
                        Text('Camera',
                            style: ts_big.copyWith(color: Colors.black)
                          //textAlign: TextAlign.center,
                        ),
                      ],
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
    return Container();
  }
}
