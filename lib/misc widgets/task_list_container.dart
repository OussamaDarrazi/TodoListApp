import 'package:flutter/material.dart';
import 'package:todo_app/misc%20widgets/task_checkbox_tile.dart';
import 'package:todo_app/models/todo_item_model.dart';

class TaskListContainer extends StatelessWidget {
  final List<TodoItemModel>? todoItems;
  const TaskListContainer({super.key, this.todoItems = const []});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          color: Colors.white,
          height: todoItems!.length<3? 90.0*todoItems!.length : 270 , //TODO: edit so if n less than 3 adjust to n*90
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xC2000000),
              height: 0,
            ),
            itemCount: todoItems!.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(index),
                child: TaskCheckBoxTile(todoItem: todoItems![index],),
              );
            },
          )),
    );
  }
}
