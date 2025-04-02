import 'dart:io';

import 'package:todo_app/data_source/todo_data_source.dart';

import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final List<dynamic> TodoData = await _todoDataSource.readTodo();
    List<Todo> allTodos = TodoData.map((e) => Todo.fromJson(e)).toList();
    return allTodos;
  }

  @override
  Future<void> addTodo(String title) async {
    List<Todo> todos;
    Todo todo = Todo(title: title, createdAt: DateTime.now())
    final List<dynamic> TodoData = await _todoDataSource.readTodo();
    copyWith(T)
   // final List<dynamic> addTodo = await TodoRepository().addTodo(title);
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<void> toggleTodo(int id) {
    // TODO: implement toggleTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(int id, String newTitle) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
