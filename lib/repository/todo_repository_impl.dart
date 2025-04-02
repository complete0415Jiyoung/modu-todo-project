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

    int index = todoData.indexWhere((e) => e['id'] == id);

    if (index == -1) {
      print('해당 아이디가 존재하지 않습니다.');
      return;
    }

    final Todo targetTodo = Todo.fromJson(todoData[index]);

    final Todo updateTodo = targetTodo.copyWith(title: newTitle);

    todoData[index] = updateTodo.toJson();

    await _todoDataSource.writeTodo(todoData);
    print('[수정이 완료 되었습니다.]');
  }

  @override
  Future<void> deleteTodo(int id) async {
    final List<Map<String, dynamic>> todoData =
        await _todoDataSource.readTodo();

    int index = todoData.indexWhere((e) => e['id'] == id);

    todoData.removeAt(index);

    await _todoDataSource.writeTodo(todoData);
    print('[삭제가 완료 되었습니다.]');
  }

  @override
  Future<void> toggleTodo(int id) async {
    final List<Map<String, dynamic>> todoData =
        await _todoDataSource.readTodo();

    int index = todoData.indexWhere((e) => e['id'] == id);

    if (index == -1) {
      print('해당 아이디가 존재하지 않습니다.');
      return;
    }

    final Todo targetTodo = Todo.fromJson(todoData[index]);

     final Todo updateTodo = targetTodo.copyWith(completed: targetTodo.completed == false?true : false);

    todoData[index] = updateTodo.toJson();

    await _todoDataSource.writeTodo(todoData);
    print('[상태 체크 수정 완료 되었습니다.]');
  }
}
