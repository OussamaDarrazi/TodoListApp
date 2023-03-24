import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_list_model.dart';
import 'package:todo_app/pages/main_page.dart';

import 'misc widgets/circle_design.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoListModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          checkboxTheme: CheckboxThemeData(
            side: const BorderSide(color: Color(0xFF4A3780)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            splashRadius: 0,
          ),
          textTheme: const TextTheme(
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
              displayLarge: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              )),
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.inter().fontFamily),
      home: const MainPage(),
    );
  }
}

