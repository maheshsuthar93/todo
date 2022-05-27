import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant/todo_styles.dart';
import 'package:todo/ui/common/input_box.dart';

import '../../constant/todo_strings.dart';
import '../../controllers/add_controller.dart';
import '../common/title.dart';

class AddTodoScreen extends StatelessWidget {
  AddController _ac = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: secondary, //change your color here
          ),
          backgroundColor: primary,
          elevation: 0,
          centerTitle: true,
          title: Obx(()=>TodoTitle(title: _ac.title.value))),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: Colors.white30),
              ),
              child: Image.asset(
                'assets/pencil.png',
                height: 20,
                color: Colors.white30,
                width: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputBox(
              hint: ADD_TODO_HINT_TASK_NAME,
              controller: _ac.nameController,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 14,
            ),
            InputBox(
              hint: ADD_TODO_HINT_TASK_DESC,
              controller: _ac.desController,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 14,
            ),
            InputBox(
              hint: ADD_TODO_HINT_TASK_DATE,
              controller: _ac.dateController,
              inputType: TextInputType.datetime,
              isReadyOnly: true,
              suffixIcon: InkWell(
                onTap: () {
                  _ac.selectDate(context);
                },
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white24,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(14),
              child: ElevatedButton(
                onPressed: () {
                  if (_ac.isValid()) _ac.addTodo();
                },
                child: Text(ADD_TODO_ACTION,
                    style: styleSemiBold.copyWith(
                        fontSize: 14, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
