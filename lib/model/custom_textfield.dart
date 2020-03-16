import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hintName ;
  final TextEditingController controller ;
  final TextDirection directionality;
  final Color color ;
  final Color color3 ;
  final bool secure ;




  const CustomTextField({Key key, this.hintName,@required this.color3, this.controller,@required this.secure, this.directionality,this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: directionality,
      child: Container(
        height: 50,
        child: TextField(
          obscureText: secure,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
          maxLines: 1,
          decoration:
          InputDecoration(
              border: InputBorder.none,
              hintText: (hintName)
          ),
          controller: controller,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color:  color3,
                  blurRadius:40,
                  offset: Offset(0, 4),
                  spreadRadius: -15
              )
            ]
        ),
      ),
    );
  }
}


