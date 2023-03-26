import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../misc widgets/background_layout.dart';
import '../misc widgets/my_main_button.dart';
import '../misc widgets/task_list_container.dart';
import '../models/todo_list_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    final todolistmodel = Provider.of<TodoListModel>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackgroundLayout(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.only(top: 15),
                  //   alignment: Alignment.bottomLeft,
                  //   child: Text(
                  //     "Welcome,",
                  //     style: Theme.of(context).textTheme.displayMedium,
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: Text(
                      "My Todo List",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 270,
                    child: TaskListContainer(
                      todoItems: todolistmodel.todos
                          .where((element) => element.isCompleted == false)
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Completed",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TaskListContainer(
                    todoItems: todolistmodel.todos
                        .where((element) => element.isCompleted == true)
                        .toList(),
                  ),
                  const Spacer(),
                  MyMainButton(text: "Add Task", onPressed: () {
                    Navigator.pushNamed(context, "addtask");
                  },),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}