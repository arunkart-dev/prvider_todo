import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prvider_todo/Widgets/todo_tile.dart';
import 'package:prvider_todo/providers/todo_provider.dart';
import 'package:prvider_todo/screens/addtodo.dart';
import 'package:shimmer/shimmer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() => _isloading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'My Todo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            _isloading
                ? ListView.builder(
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                            title: SizedBox(
                              height: 16,
                              width: 100,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                            subtitle: SizedBox(
                              height: 14,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                )
                : todoProvider.todos.isEmpty
                ? const Center(child: Text('No Todos yet'))
                : ListView.builder(
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoProvider.todos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                      child: TodoTile(
                        todo: todo,
                        ondelete: () => todoProvider.deletetodo(index),
                        ontoggle: () => todoProvider.toggletodo(index),
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Addtodo()),
          );
        },
        child: const Icon(Icons.add,size: 28,),
      ),
    );
  }
}
