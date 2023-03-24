import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../misc widgets/background_layout.dart';
import '../misc widgets/task_list_container.dart';
import '../models/todo_list_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    final todolistmodel = Provider.of<TodoListModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundLayout(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: Text(
                      "October 20, 2022",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
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
                  TaskListContainer(
                    todoItems: todolistmodel.todos
                        .where((element) => element.isCompleted == false)
                        .toList(),
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
                  FilledButton.tonal(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF4A3780)),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(MediaQuery.of(context).size.width, 50)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add New Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}