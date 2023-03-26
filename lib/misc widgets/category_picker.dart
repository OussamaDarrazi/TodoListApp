import 'package:flutter/material.dart';

class CategoryPicker extends StatelessWidget {
  final Function()? onTap;
  final Map<String, List<dynamic>> categories;
  const CategoryPicker({super.key, required this.categories, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: categories[categories.keys.elementAt(index)]![1],
                ),
                child: categories[categories.keys.elementAt(index)]![0],
              ),
            );
          }),
    );
  }
}
