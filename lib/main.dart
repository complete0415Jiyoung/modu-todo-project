import 'dart:io';

import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/view/todo_list_view.dart';
import 'data_source/todo_data_source_impl.dart';
import 'repository/todo_repository_impl.dart';

void main() async {
  bool isFlag = true;

  final TodoRepository todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
  );
  final List<Todo> todos = await todoRepository.getTodos();

  while (isFlag) {
    printMeun();

    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        print('목록보기');
        TodoListView().listView(todos);
        break;
      case '2':
        print('할 일 추가');
        break;
      case '3':
        print('할 일 수정');
        break;
      case '4':
        print('완료 상태 체크');
        break;
      case '5':
        print('할 일 삭제');
        break;
      case '0':
        print('종료');
        isFlag = false;
        break;
      default:
        print('똑바로해');
    }
  }
}

void printMeun() {
  print('TODOLIST 프로그램');
  print('1. 목록 보기');
  print('2. 할 일 추가');
  print('3. 할 일 수정');
  print('4. 완료 상태 체크');
  print('5. 할 일 삭제');
  print('0. 종료');

  print('\n');
  print('선택하세요');
}
