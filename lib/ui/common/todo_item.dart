import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constant/todo_styles.dart';

import '../../model/todo_model.dart';

class TodoItem extends StatelessWidget {
  TodoModel todoModel;
  VoidCallback callback;

  TodoItem({required this.todoModel, required this.callback});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: primary),
              ),
              child: Image.asset(
                'assets/pencil.png',
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoModel.name,
                    style: styleSemiBold.copyWith(
                        fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    todoModel.description,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style:
                        styleRegular.copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    todoModel.date,
                    style: styleSemiBold.copyWith(
                        fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                callback();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
