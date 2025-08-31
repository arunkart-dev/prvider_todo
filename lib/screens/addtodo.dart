import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prvider_todo/model/todomodel.dart';
import 'package:prvider_todo/providers/todo_provider.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final _titlecontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add todo"),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptioncontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final todo = Todomodel(
                  title: _titlecontroller.text,
                  description: _descriptioncontroller.text,
                  date: DateTime.now(),
                  completed: false,
                );
                context.read<TodoProvider>().addtodo(todo);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(300, 40)
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
