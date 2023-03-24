import 'package:flutter/material.dart';
import '../misc widgets/circle_design.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Text(
                          "Add New Task",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
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
                flex: 9,
                child: Container(
                  color: const Color(0xFFF1F5F9),
                  child: Column(
                    children: [
                      Text("Task Title"),
                      TextField(),
                      Row(),
                      Text("when"),
                      Row(
                        children: [

                        ],
                      ),
                      Text("Notes"),
                      TextField(
                        maxLines: 4,
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
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
