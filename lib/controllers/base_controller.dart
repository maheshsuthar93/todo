import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/home/home.dart';

class BaseController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  RxString name = "".obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  RxInt selectedPos = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    user = auth.currentUser;
    if (user != null) name.value = user!.displayName!;
    super.onInit();
  }

  getScreen() {
    switch (this.selectedPos.value) {
      case 0:
        return HomeScreen();
    }
  }
}
