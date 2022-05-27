import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo/constant/todo_styles.dart';

import '../../constant/todo_screens.dart';
import '../../controllers/base_controller.dart';
import '../../controllers/home_controller.dart';
import '../common/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeController _lc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _lc.refresh();
        },
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/nature.png",
                  height: 250,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white38,
                        height: 250,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 25),
                                  padding: EdgeInsets.only(right:5,bottom: 5,top: 5),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                          onTap: () {
                                            BaseController _bc = Get.find();
                                            _bc.openDrawer();
                                          },
                                          child: SvgPicture.asset(
                                              "assets/menu.svg",color: Colors.white,))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Your\nThings",
                                  style: styleSemiBold.copyWith(
                                      fontSize: 28, color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              "5,Sep 2015",
                              style: styleRegular.copyWith(
                                  fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.black12,
                        height: 250,
                        child: Stack(
                          // mainAxisSize: MainAxisSize.max,
                          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "24",
                                        style: styleSemiBold.copyWith(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text("Personal",
                                          style: styleRegular.copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "15",
                                        style: styleSemiBold.copyWith(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text(
                                        "Business",
                                        style: styleRegular.copyWith(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 10,
                              child: Text(
                                "60% done",
                                style: styleRegular.copyWith(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: _lc.todoList.length,
                  padding: EdgeInsets.only(top: 8, bottom: 50),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, bottom: 15),
                      child: TodoItem(
                        todoModel: _lc.todoList[index],
                        callback: () {
                          _lc.deleteTodo(_lc.todoList[index].id);
                        },
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(ADD_TODO);
        },
      ),
    );
  }
}
