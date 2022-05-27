import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constant/todo_constants.dart';
import '../constant/todo_screens.dart';
import '../constant/todo_styles.dart';

class LoginController extends GetxController {
  final emailController = new TextEditingController();
  final passController = new TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(credential).then((value) => {
          print(value.user.toString()),
          FirebaseFirestore.instance
              .collection(FIREBASE_TABLE_USERS)
              .doc(value.user!.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) async {
            if (documentSnapshot.exists) {
              print('Document data: ${documentSnapshot.data()}');
              await FirebaseFirestore.instance
                  .collection(FIREBASE_TABLE_USERS)
                  .doc(value.user!.uid)
                  .update({
                FIREBASE_KEY_LAST_LOGGED_AT: FieldValue.serverTimestamp()
              });
              Get.offAllNamed(BASE);
            } else {
              print('Document does not exist on the database');

              await FirebaseFirestore.instance
                  .collection(FIREBASE_TABLE_USERS)
                  .doc(value.user!.uid)
                  .set({
                FIREBASE_KEY_USERID: value.user!.uid,
                FIREBASE_KEY_EMAIL: value.user!.email,
                FIREBASE_KEY_DISPLAY_NAME: value.user!.displayName,
                FIREBASE_KEY_LAST_LOGGED_AT: FieldValue.serverTimestamp(),
                FIREBASE_KEY_PHOTO: value.user!.photoURL,
              });

              Get.offAllNamed(BASE);
            }
          })
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
