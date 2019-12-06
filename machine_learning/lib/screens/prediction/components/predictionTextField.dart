import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PredictionTextField extends StatelessWidget {
  final String hintText;
  final String defaultValue;
  final Function onSave;
  final TextEditingController controller;

  PredictionTextField(
      {@required this.hintText,
      this.defaultValue,
      this.onSave,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil.getInstance().setHeight(120),
        vertical: ScreenUtil.getInstance().setHeight(10),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          if (onSave != null) onSave(value);
        },
        keyboardType: TextInputType.numberWithOptions(signed: false),
        style: TextStyle(
            color: Colors.white, fontSize: ScreenUtil.getInstance().setSp(42)),
        decoration: InputDecoration(
            hintText:
                '${hintText.toUpperCase().replaceAll(RegExp('_'), ' ')} - $defaultValue',
            contentPadding:
                EdgeInsets.all(ScreenUtil.getInstance().setHeight(45)),
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: ScreenUtil.getInstance().setSp(28)),
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
