import 'package:flutter/material.dart';
import 'package:todoapp/pages/todolist_page.dart';
import 'package:todoapp/pages/calender_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const MainScreen(),
      '/todo': (context) => const ToDoList_Page(),
      '//': (context) => const Calender(),
    },
  ));
}
