import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/misc%20widgets/category_icons.dart';
import 'package:todo_app/models/todo_item_model.dart';
import 'package:todo_app/models/todo_list_model.dart';
import '../misc widgets/circle_design.dart';
import '../misc widgets/my_main_button.dart';

final titleController = TextEditingController();
final notesController = TextEditingController();
String category = categoryIcons.keys.toList()[0];

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TodoListModel>(
        builder: (context, todoListModel, child) =>  Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text("Add Task", style: Theme.of(context).textTheme.displayMedium,),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              //background
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(children: [
                      Container(
                        color: const Color(0xFF4A3780),
                      ),
                      const Positioned(
                        left: -190,
                        top: -60,
                        child: CircleDesign(
                          radius: 150,
                          stroke: 50,
                        ),
                      ),
                      const Positioned(
                        right: -60,
                        top: 20,
                        child: CircleDesign(
                          radius: 80,
                          stroke: 30,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 13,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: const Color(0xFFF1F5F9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text("Task Title",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  )),
                          MyTextField(controller: titleController,),
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Categories: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: Colors.black),
                                ),
                                const CategoryPicker(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text("Notes",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  )),
                          MyTextField(
                            controller: notesController,
                            maxLines: 4,
                          ),
                          const Spacer(),
                          MyMainButton(
                            text: "Save",
                            onPressed: () {
                              todoListModel.addTodo(TodoItemModel(title: titleController.text, notes: notesController.text,category: category, isCompleted: false, id: todoListModel.todos.length));
                              titleController.text="";
                              notesController.text="";
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({
    super.key,
  });

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryIcons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  category = categoryIcons.keys.toList()[index];
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: _selectedIndex == index
                      ? Border.all(color: Colors.deepPurple, width: 3)
                      : const Border(),
                  borderRadius: BorderRadius.circular(30),
                  color: categoryIcons[categoryIcons.keys.elementAt(index)]![1],
                ),
                child: categoryIcons[categoryIcons.keys.elementAt(index)]![0],
              ),
            );
          }),
    );
  }
}

class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final String? hintText;
  final int maxLines;
  const MyTextField({
    super.key,
    this.hintText,
    this.maxLines = 1, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
              )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.white,
          filled: true),
    );
  }
}
