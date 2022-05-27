import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constant/todo_styles.dart';

class TodoTitle extends StatelessWidget {
  String title = "";

  TodoTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: styleSemiBold.copyWith(fontSize: 20, color: Colors.white),
    );
  }
}
