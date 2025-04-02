import 'dart:io';

import 'package:test/test.dart';
import 'package:todo_app/data_source/mock_todo_data_source_impl.dart';
import 'package:todo_app/log_service.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';
import 'package:todo_app/view/todo_view.dart';


void main() {
  group('TODOLIST', () {
 final TodoRepository todoRepository = TodoRepositoryImpl(MockTodoDatasourceImpl());
    test('할 일 추가 테스트', () async {

      List<Todo> beforeTodos = await todoRepository.getTodos();

      await todoRepository.addTodo('새로운 할 일');

    });
  });

}