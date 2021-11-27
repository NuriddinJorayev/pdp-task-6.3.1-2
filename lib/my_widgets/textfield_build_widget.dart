// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextField_Widget extends StatefulWidget {

  final Widget textfild;
   final bool isActive;
   final double hi;

   
  

  TextField_Widget( this.textfild,  this.isActive, [this.hi = 60.0] );

  @override
  _TextField_WidgetState createState() => _TextField_WidgetState();
  
}



class _TextField_WidgetState extends State<TextField_Widget> {

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      height: widget.hi,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255,255,255,255),
        borderRadius: BorderRadius.circular(50.0),
        border: widget.isActive?  Border.all(
          color: Color.fromARGB(255, 68, 164, 255),
          width:  1.8
        ): Border(),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255,245,246,248),
          blurRadius: 32.0,
          offset: Offset(0.0, -25.0),
          spreadRadius: -3

        ),
        BoxShadow(
          color: Color.fromARGB(255,245,246,248),
          blurRadius: 32.0,
          offset: Offset(0.0, 25.0),
          spreadRadius: -3

        )
      ]
      ),
      child: widget.textfild
    ),
  );

 
}