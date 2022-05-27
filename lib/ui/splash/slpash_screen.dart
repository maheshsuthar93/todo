import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant/todo_strings.dart';
import 'package:todo/constant/todo_styles.dart';
import 'package:todo/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashController _sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: primary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              APP_NAME,
              style: styleRegular.copyWith(fontSize: 20, color: Colors.white),
            ),
            Text(
              "A todo app",
              style: styleRegular.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    ));
  }
}
