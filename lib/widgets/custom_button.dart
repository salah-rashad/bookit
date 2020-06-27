import 'package:bookit/ui/apptheme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Function onTap;
  final Color bgColor;
  final Color textColor;
  final Color shadowColor;
  final bool isBorderd;

  const CustomButton({
    Key key,
    this.name,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.shadowColor,
    this.isBorderd = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            name,
            style: AppTextStyle(color: textColor, size: 18.0).bold(),
          ),
        ),
        decoration: BoxDecoration(
            color: isBorderd ? Colors.transparent : bgColor,
            borderRadius: BorderRadius.circular(30),
            border: isBorderd ? Border.all(color: grey1) : null,
            boxShadow: [
              getShadow(),
            ]),
      ),
    );
  }

  BoxShadow getShadow() {
    if (isBorderd)
      return BoxShadow(color: Colors.transparent);
    else
      return BoxShadow(
          color: shadowColor.withOpacity(0.50),
          blurRadius: 20,
          offset: Offset(0, 4));
  }
}
