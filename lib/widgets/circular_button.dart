import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Object onTap;
  final Image image;
  final Color bgColor;
  final Color shadowColor;
  final IconButton icon;

  const CircularButton(
      {Key key,
      this.onTap,
      this.image,
      this.bgColor,
      @required this.shadowColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        child: ClipOval(child: image),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.16),
                blurRadius: 20,
                offset: Offset(0, 4), 
              ),
            ]),
      ),
    );
  }
}
