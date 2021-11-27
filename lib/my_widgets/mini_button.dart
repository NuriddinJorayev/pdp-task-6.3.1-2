


  import 'package:flutter/material.dart';

class Button_builder extends StatefulWidget {
    final String name;
    final  image;
    final Color color;

    Button_builder({required this.name, required this.image, required this.color});
  
    @override
    _Button_builderState createState() => _Button_builderState();
  }
  
  class _Button_builderState extends State<Button_builder> {
    @override
    // ignore: override_on_non_overriding_member
    Widget build(BuildContext context) {
      return Container(
        height: 38.0,
        width: (MediaQuery.of(context).size.width / 2) - 72,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255,217,230,251),
              blurRadius: 5.0,
              offset: Offset(0, 7),
              spreadRadius: -5.0
            )
          ]
        ),
        child: MaterialButton(
          height: double.infinity,
          minWidth: double.infinity,
          onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: widget.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              Icon(widget.image, color: Colors.white, size: 17,),
              SizedBox(width: 10.0,),
              Text(widget.name, style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13.0, letterSpacing: 0.5),)
            ],
          ),
          ),
      );
    }
  }