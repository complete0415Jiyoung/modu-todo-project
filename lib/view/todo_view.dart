import 'dart:io';

import 'package:intl/intl.dart';
import 'package:todo_app/data_source/todo_data_source_impl.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

class TodoView {
  final TodoRepository _todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
  );

  Future<void> listView(logFile) async {
    try {
      bool isfliter = true;
      final List<Todo> todos = await _todoRepository.getTodos();
      while (isfliter) {
        print('\n 🪄필터  \n');
        print('  ➖  1️⃣  날짜 오름차순으로 보기\n');
        print('  ➖  2️⃣  날짜 내림차순으로 보기\n');
        print('  ➖  3️⃣  완료된 목록보기\n');
        print('  ➖  4️⃣  미완료 목록보기\n');
        String? userInput = stdin.readLineSync();
        switch (userInput) {
          case '1':
            todos.sort((a, b) => a.createdAt.compareTo(b.createdAt));
            isfliter = false;
            break;
          case '2':
            todos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
            isfliter = false;
            break;
          case '3':
            todos.where((e) => e.completed == true).toList();
            isfliter = false;
            break;
          case '4':
            todos.where((e) => e.completed == false).toList();
            isfliter = false;
            break;
          default:
            throw ('올바른 값을 입력해주세요');
        }
      }

      print('ID |   TITLE   | CREAT_DATE ');
      for (int i = 0; i < todos.length; i++) {
        print(
          '${todos[i].id}. [${todos[i].completed ? 'X' : ' '}] ${todos[i].title}(${DateFormat('yyyy-MM-dd HH:mm:ss').format(todos[i].createdAt)})',
        );
      }
      print('--------------------------------------------------');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addView(logFile) async {
    try {
      print('[할 일 제목을 입력하세요.]');
      final String titleInput = stdin.readLineSync().toString().trim();

      await _todoRepository.addTodo(titleInput);
      await logFile.log('할 일 추가됨');
      print('--------------------------------------------------');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateView(logFile) async {
    try {
      print('수정할 할 일 ID를 입력하세요');
      final String idInput = stdin.readLineSync().toString();

      print('새 제목을 입력하세요');
      final String titleInput = stdin.readLineSync().toString().trim();

      await _todoRepository.updateTodo(int.parse(idInput), titleInput);
      await logFile.log('todoId[$idInput]할 일 수정됨');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteView(logFile) async {
    try {
      print('삭제할 할 일 ID를 입력하세요');
      final String idInput = stdin.readLineSync().toString();

      await _todoRepository.deleteTodo(int.parse(idInput));
      await logFile.log('todoId[$idInput] 할 일 삭제됨');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleView(logFile) async {
    try {
      print('완료 상태를 토글할 할 일 ID를 입력하세요');
      final String idInput = stdin.readLineSync().toString();
      await _todoRepository.toggleTodo(int.parse(idInput));
      await logFile.log('todoId[$idInput] 할 일 상태 변경됨');
    } catch (e) {
      rethrow;
    }
  }
}
