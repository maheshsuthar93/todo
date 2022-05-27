import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/todo_screens.dart';
import '../constant/todo_styles.dart';
import '../controllers/base_controller.dart';

class BaseScreen extends StatelessWidget {
  BaseController _bc = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Obx(() => _bc.getScreen()),
        key: _bc.scaffoldKey,
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Obx(() => ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: primary,
                    ),
                    child: Text(""),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    selectedColor: primary,
                    selected: _bc.selectedPos.value == 0,
                    leading: Icon(
                      Icons.home,
                    ),
                    onTap: () {
                      Get.back();
                      _bc.selectedPos.value = 0;
                    },
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    leading: Icon(
                      Icons.logout,
                    ),
                    onTap: () {
                      FirebaseAuth.instance.signOut();

                      Get.offNamedUntil(LOGIN, (route) => false);
                    },
                  ),
                ],
              )),
        ));
  }
}
