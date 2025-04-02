import 'dart:io';

import 'package:todo_app/data_source/todo_data_source.dart';

import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final List<dynamic> todoData = await _todoDataSource.readTodo();
    List<Todo> allTodos = todoData.map((e) => Todo.fromJson(e)).toList();
    return allTodos;
  }

  @override
  Future<void> addTodo(String title) async {
    final List<Map<String, dynamic>> todoData =
        await _todoDataSource.readTodo();

    final Todo lastTodo = Todo.fromJson(todoData.last);

    final Todo newTodo = lastTodo.copyWith(id: lastTodo.id + 1, title: title);

    todoData.add(newTodo.toJson());

    _todoDataSource.writeTodo(todoData);
  }

  @override
  Future<void> updateTodo(int id, String newTitle) async {
    final List<Map<String, dynamic>> todoData =
        await _todoDataSource.readTodo();

    todoData.indexWhere((e) => e[id] == id);
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
}
