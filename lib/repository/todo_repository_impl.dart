import 'package:todo_app/data_source/todo_data_source.dart';

import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final TodoData = await _todoDataSource.readTodo();
  }

  @override
  Future<void> addTodo(String title) {
    // TODO: implement addTodo
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
