import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constant/todo_strings.dart';
import '../../constant/todo_styles.dart';
import '../../controllers/login_controller.dart';
import '../common/input_box.dart';

class LoginScreen extends StatelessWidget {
  LoginController _lc = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 112),
                child: Text(
                  'Log In',
                  style: styleBold.copyWith(fontSize: 30, color: primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 35),
                child: Text(
                  "Please enter email and password to continue " +
                      " using our app",
                  style: styleRegular.copyWith(fontSize: 14, color: primary),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InputBox(
                hint: LOGIN_HINT_EMAIL,
                inputType: TextInputType.emailAddress,
                controller: _lc.emailController,
                borderColor: primary,
                hintColor: primary,
              ),
              InputBox(
                hint: LOGIN_HINT_PASS,
                inputType: TextInputType.text,
                controller: _lc.passController,
                borderColor: primary,
                obscureText: true,
                hintColor: primary,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: new GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      height: 50,
                      child: new Material(
                        child: new InkWell(
                          onTap: () {
                            _lc.showToast("Please login using Google only.");
                          },
                          child: Container(
                            child: Text(
                              'Continue',
                              style: styleSemiBold.copyWith(
                                  fontSize: 14, color: Colors.white),
                              //style: styleButton,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: secondary),
                    )),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "-Or sign in with-",
                        style: styleMedium.copyWith(
                            color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                        child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/google.jpg'),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ))),
                        onTap: () {
                          _lc.signInWithGoogle();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
