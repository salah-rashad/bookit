import 'package:bookit/ui/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final TextDirection directionality;
  final TextInputType textInputType;
  final Color bgColor;
  final Color shadowColor;
  final bool secure;
  final ValueChanged<String> change;

  const CustomTextFormField(
      {Key key,
      this.hintText,
      @required this.shadowColor,
      this.controller,
      @required this.secure,
      this.directionality,
      this.textInputType,
      this.bgColor,
      this.validator,
      this.change})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: directionality,
      child: Container(
        height: 50,
        child: TextFormField(
          validator: validator,
          onChanged: change,
          obscureText: secure,
          keyboardType: textInputType,
          textAlign: TextAlign.center,
          style: AppTextStyle(color: darkBlue, size: 18.0).bold(),
          maxLines: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: (hintText),
              hintStyle: AppTextStyle(color: grey1, size: 18.0).bold()),
          controller: controller,
        ),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.16),
                blurRadius: 20,
                offset: Offset(0, 4),
              )
            ]),
      ),
    );
  }
}
