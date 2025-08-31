import 'package:flutter/material.dart';
import 'package:prvider_todo/model/todomodel.dart';

class TodoTile extends StatelessWidget {
  final Todomodel todo;
  final VoidCallback ontoggle;
  final VoidCallback ondelete;
  const TodoTile({super.key,required this.todo,required this.ondelete,required this.ontoggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
         onChanged: (_) => ontoggle(),
         ),
         title: Text(todo.title,style: TextStyle(decoration: todo.completed ? TextDecoration.lineThrough : null),),
         subtitle: Text(todo.description),
         trailing: IconButton(
          onPressed: ondelete,
           icon: Icon(Icons.delete)
           ),
    );
  }
}
