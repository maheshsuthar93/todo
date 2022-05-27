import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/todo_styles.dart';

class InputBox extends StatelessWidget {
  String hint;
  TextInputType inputType;
  Widget? suffixIcon;
  TextEditingController controller;
  bool obscureText = false;
  bool isReadyOnly = false;
  Color borderColor;
  Color hintColor;

  InputBox(
      {required this.hint,
      required this.inputType,
      this.suffixIcon,
      this.obscureText = false,
      this.isReadyOnly = false,
      this.borderColor = Colors.white,
      this.hintColor = Colors.white38,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      style: styleSemiBold.copyWith(fontSize: 16, color: this.borderColor),
      //  inputFormatters: [LengthLimitingTextInputFormatter(10)],
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      readOnly: isReadyOnly,
      onChanged: (text) {},

      keyboardType: inputType,

      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: this.borderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: this.borderColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: this.borderColor),
        ),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: styleRegular.copyWith(fontSize: 16, color: this.hintColor),
      ),
    );
  }
}
