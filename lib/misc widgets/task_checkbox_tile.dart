import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_item_model.dart';
import 'package:todo_app/models/todo_list_model.dart';

import 'category_icons.dart';


class TaskCheckBoxTile extends StatelessWidget {
  final TodoItemModel todoItem;
  const TaskCheckBoxTile({super.key, required this.todoItem,});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListModel>(
      builder: (context, todoListModel, child) {
        
      return GestureDetector(
          onTap: () {
            todoListModel.toggleCompleted(todoItem);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 90,
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: todoItem.isCompleted? categoryIcons[todoItem.category]![1].withOpacity(.5): categoryIcons[todoItem.category]![1]),
                  child: categoryIcons[todoItem.category]![0],
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    todoItem.title,
                    style: todoItem.isCompleted? TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: Colors.black.withOpacity(.3), decoration: TextDecoration.lineThrough):TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),
                )),
                Container(
                  child: Checkbox(
                    value: todoItem.isCompleted,
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
          ),
      );
      
  });
  }
}
