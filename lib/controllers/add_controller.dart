import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constant/todo_constants.dart';
import '../constant/todo_strings.dart';
import '../constant/todo_styles.dart';

class AddController extends GetxController {
  final nameController = new TextEditingController();
  final desController = new TextEditingController();
  final dateController = new TextEditingController();
  User? user;
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection(FIREBASE_TABLE_TODO);

  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  init() async {
    user = await FirebaseAuth.instance.currentUser;
  }

  addTodo() {
    _collectionRef.add({
      FIREBASE_KEY_CREATED_AT: FieldValue.serverTimestamp(),
      FIREBASE_KEY_DATE: dateController.text.toString().trim(),
      FIREBASE_KEY_DESC: desController.text.toString().trim(),
      FIREBASE_KEY_NAME: nameController.text.toString().trim(),
      FIREBASE_KEY_USERID: user!.uid,
    }).then((value) async => {
          await _collectionRef.doc(value.id).update({"id": value.id}),
          showToast(ADD_TODO_SUCCESSFULLY),
          Get.back()
        });
  }

  isValid() {
    if (nameController.text.trim().isEmpty) {
      showToast(ERR_MISSING_NAME);
      return false;
    } else if (desController.text.trim().isEmpty) {
      showToast(ERR_MISSING_DESC);
      return false;
    } else if (dateController.text.trim().isEmpty) {
      showToast(ERR_MISSING_DATE);
      return false;
    }
    return true;
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: primary,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showLoader(bool isShow) {
    if (isShow)
      Get.dialog(
          Center(
            child: Image.asset(
              'assets/loader.gif',
              height: 80,
              width: 80,
            ),
          ),
          barrierDismissible: false);
    else {
      Get.back();
    }
  }

  selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    var lastDate =
        DateTime(selectedDate.year + 1, selectedDate.month, selectedDate.day);

    final DateTime? picked = await showDatePicker(
        context: context,
        helpText: "Select todo date",
        initialDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light().copyWith(
                primary: primary,
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime.now(),
        lastDate: lastDate);
    if (picked != null && picked != selectedDate) {
      var month = picked.month < 9 ? "0${picked.month}" : picked.month;
      var year = picked.year;
      var day = picked.day < 9 ? "0${picked.day}" : picked.day;
      var dateForText = "${month}-${day}-${year}";

      dateController.text = dateForText;
    }
  }
}
