import 'dart:io';

import 'package:todo_app/data_source/todo_data_source_impl.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

class TodoView {
  final TodoRepository _todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
  );

  Future<void> listView() async {
    final List<Todo> todos = await _todoRepository.getTodos();
    print('ID |   TITLE   | CREAT_DATE ');

    for (int i = 0; i < todos.length; i++) {
      print(
        '${todos[i].id}. [${todos[i].completed ? 'X' : ' '}] ${todos[i].title}(${todos[i].createdAt})',
      );
    }
    print('--------------------------------------------------');
  }

  Future<void> addView() async {
    print('[할 일 제목을 입력하세요.]');
    final String titleInput = stdin.readLineSync().toString().trim();

    await _todoRepository.addTodo(titleInput);

    print('--------------------------------------------------');
  }

  Future<void> updateView() async {
    print('수정할 할 일 ID를 입력하세요');
    final String idInput = stdin.readLineSync().toString();

    print('새 제목을 입력하세요');
    final String titleInput = stdin.readLineSync().toString().trim();

    await _todoRepository.updateTodo(int.parse(idInput), titleInput);
  }

  Future<void> deleteView() async {
    print('삭제할 할 일 ID를 입력하세요');
    final String idInput = stdin.readLineSync().toString();

    await _todoRepository.deleteTodo(int.parse(idInput));
  }

  Future<void> toggleView() async {
    print('완료 상태를 토글할 할 일 ID를 입력하세요');
    final String idInput = stdin.readLineSync().toString();
    await _todoRepository.toggleTodo(int.parse(idInput));
  }
}
