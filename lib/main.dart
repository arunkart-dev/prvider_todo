import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prvider_todo/providers/todo_provider.dart';
import 'package:prvider_todo/screens/homescreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => TodoProvider(),
    child:const MyApp(),
    ), );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider todo',
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}
