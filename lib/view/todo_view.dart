import 'dart:io';

import 'package:todo_app/data_source/todo_data_source_impl.dart';
import 'package:todo_app/log_service.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

class TodoView {
  final TodoRepository _todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
  );

  Future<void> listView(logFile) async {
    final List<Todo> todos = await _todoRepository.getTodos();
    print('ID |   TITLE   | CREAT_DATE ');

    for (int i = 0; i < todos.length; i++) {
      print(
        '${todos[i].id}. [${todos[i].completed ? 'X' : ' '}] ${todos[i].title}(${todos[i].createdAt})',
      );
    }
    print('--------------------------------------------------');
    await logFile.log('할 일 목록 조회됨');
  }

  Future<void> addView(logFile) async {
    print('[할 일 제목을 입력하세요.]');
    final String titleInput = stdin.readLineSync().toString().trim();

    await _todoRepository.addTodo(titleInput);
    await logFile.log('할 일 추가됨');
    print('--------------------------------------------------');
  }

  Future<void> updateView(logFile) async {
    print('수정할 할 일 ID를 입력하세요');
    final String idInput = stdin.readLineSync().toString();

    print('새 제목을 입력하세요');
    final String titleInput = stdin.readLineSync().toString().trim();

    await _todoRepository.updateTodo(int.parse(idInput), titleInput);
    await logFile.log('todoId[$idInput]할 일 수정됨');
  }

  Future<void> deleteView(logFile) async {
    print('삭제할 할 일 ID를 입력하세요');
    final String idInput = stdin.readLineSync().toString();

    await _todoRepository.deleteTodo(int.parse(idInput));
    await logFile.log('todoId[$idInput] 할 일 삭제됨');
  }

  Future<void> toggleView(logFile) async {
    print('완료 상태를 토글할 할 일 ID를 입력하세요');
    final String idInput = stdin.readLineSync().toString();
    await _todoRepository.toggleTodo(int.parse(idInput));
    await logFile.log('todoId[$idInput] 할 일 상태 변경됨');
  }
}
