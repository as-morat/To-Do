import 'package:flutter/material.dart';
import 'package:todo/todo_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false
      ),
      home: SafeArea(child: TodoPage()),
    );
  }
}

