import 'package:flutter/material.dart';



class round_rectangle_button extends StatelessWidget {
  final Function press;
  final double h;
  final double w;
  final Color button_color;
  final Widget rec_child;
  round_rectangle_button( {this.h, this.w, this.rec_child, this.button_color,this.press});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Color(0xFFEB1555),
      child: rec_child,
      onPressed: press,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all( Radius.circular(10)),
      ),
      elevation: 10,
      constraints: BoxConstraints.tightFor(
        width: w,
        height: h,
      ),
      fillColor: button_color,
    );
  }
}
