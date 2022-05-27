import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo/model/todo_model.dart';

import '../constant/todo_constants.dart';
import '../constant/todo_styles.dart';

class HomeController extends GetxController {
  RxList<TodoModel> todoList = new RxList();
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection(FIREBASE_TABLE_TODO);
  User? user;
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 10; // documents to be fetched per request
  DocumentSnapshot?
      lastDocument; // flag for last document from where next 10 records to be fetched

  ScrollController _scrollController =
      ScrollController(); // listener for listview scrolling

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    this.init();
  }

  init() async {
    user = await FirebaseAuth.instance.currentUser;
    getTodos();

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = Get.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        getTodos();
      }
    });
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

  getTodos() async {
    if (!hasMore) {
      print('No More Products');
      return;
    }
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await _collectionRef
          .orderBy(FIREBASE_KEY_CREATED_AT)
          .where(FIREBASE_KEY_USERID, isEqualTo: user!.uid)
          .limit(documentLimit)
          .get();
    } else {
      querySnapshot = await _collectionRef
          .orderBy(FIREBASE_KEY_CREATED_AT)
          .startAfterDocument(lastDocument!)
          .where(FIREBASE_KEY_USERID, isEqualTo: user!.uid)
          .limit(documentLimit)
          .get();
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];

    querySnapshot.docs.forEach((doc) {
      todoList.add(TodoModel(
          id: doc["id"],
          name: doc["name"],
          description: doc["description"],
          date: doc["date"]));
    });
  }

  void refresh() {
    this.hasMore = true;
    this.lastDocument = null;
    this.todoList.clear();
    this.getTodos();
  }

  deleteTodo(String id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Remove todo'),
        content: const Text('Do you want to delete this permanently?'),
        actions: [
          TextButton(
            child: const Text("No"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("Yes"),
            onPressed: () => {Get.back(), deleteUser(id)},
          ),
        ],
      ),
    );
  }

  Future<void> deleteUser(String id) {
    return _collectionRef
        .doc(id)
        .delete()
        .then((value) =>
            {this.todoList.removeWhere((element) => element.id == id)})
        .catchError((error) => print("Failed to delete user: $error"));
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
}
