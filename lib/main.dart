import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo/ui/add_todo/add_todo.dart';
import 'package:todo/ui/base.dart';
import 'package:todo/ui/login/login.dart';
import 'package:todo/ui/splash/slpash_screen.dart';

import 'constant/todo_screens.dart';
import 'constant/todo_styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: primary,
          hintColor: hintColor,
          primarySwatch: MaterialColor(0xff27bdef, color)
          //primarySwatch: Colors.blue,
          ),
      home: SplashScreen(),
      getPages: [
        GetPage(name: ADD_TODO, page: () => AddTodoScreen()),
        GetPage(name: BASE, page: () => BaseScreen()),
        GetPage(name: LOGIN, page: () => LoginScreen()),
      ],
    );
  }
}
