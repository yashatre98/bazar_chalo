import 'package:flutter/material.dart';



class round_rectangle_button extends StatefulWidget {
  final Function press;
  final double h;
  final double w;
  final Color button_color;
  final Widget rec_child;
  round_rectangle_button( {this.h, this.w, this.rec_child, this.button_color,this.press});

  @override
  _round_rectangle_buttonState createState() => _round_rectangle_buttonState();
}

class _round_rectangle_buttonState extends State<round_rectangle_button> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Color(0xFFEB1555),
      child: widget.rec_child,
      onPressed: widget.press,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all( Radius.circular(10)),
      ),
      elevation: 10,
      constraints: BoxConstraints.tightFor(
        width: widget.w,
        height: widget.h,
      ),
      fillColor: widget.button_color,
    );
  }
}
