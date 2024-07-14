import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo.dart'; // Import your Todo model class
import 'todo_list_model.dart'; // Import your TodoListModel class

void main() {
  runApp(
    ChangeNotifierProvider(
      
      create: (context) => TodoListModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List with Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer<TodoListModel>(
        builder: (context, todoList, child) {
          return ListView.builder(
            itemCount: todoList.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList.todos[index].title),
                trailing: Checkbox(
                  value: todoList.todos[index].isCompleted,
                  onChanged: (bool? value) {
                    todoList.todos[index].toggleCompleted();
                  },
                ),
                onLongPress: () {
                  todoList.removeTodoAtIndex(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new todo functionality
          Provider.of<TodoListModel>(context, listen: false).addTodo(
            Todo(title: 'New Todo Added '),
          );
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
