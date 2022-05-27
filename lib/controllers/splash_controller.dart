import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constant/todo_screens.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigate();
  }

  navigate() async {
    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null)
      Timer(Duration(seconds: 3), () => {Get.offAllNamed(BASE)});
    else
      Timer(Duration(seconds: 3), () => {Get.offAllNamed(LOGIN)});
  }
}
