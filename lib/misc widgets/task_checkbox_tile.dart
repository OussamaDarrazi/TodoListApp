import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_item_model.dart';
import 'package:todo_app/models/todo_list_model.dart';

const Map<String, Icon> categoryIcons = {
  "studies": Icon(Icons.list),
  "sports": Icon(Icons.sports_baseball_outlined),
  "chores": Icon(
    Icons.house_outlined,
  ),
  "pleasure": Icon(Icons.tag_faces_sharp),
  "friends/family": Icon(Icons.people),
  "shopping": Icon(Icons.shopping_bag_outlined)
};

class TaskCheckBoxTile extends StatelessWidget {
  final TodoItemModel todoItem;
  const TaskCheckBoxTile({super.key, required this.todoItem,});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListModel>(
      builder: (context, todoListModel, child) {
        
      return Dismissible(
        key: ValueKey(todoItem.id),
        onDismissed: (dismissDirection){
            todoListModel.toggleCompleted(todoItem);
          },
        child: GestureDetector(
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
                      color: todoItem.isCompleted? Colors.cyan.withOpacity(.1): Colors.cyan.withOpacity(.3)),
                  child: categoryIcons[todoItem.category],
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
        ),
      );}
    );
  }
}
