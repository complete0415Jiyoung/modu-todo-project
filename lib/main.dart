import 'package:todo_app/data_source/todo_data_source.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';
import 'data_source/todo_data_source_impl.dart';

void main() async {
  bool isFlag = true;

  while (isFlag) {
    printMeun();
  }

  final TodoRepository todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
  );
  print(await todoRepository.getTodos());
}

void printMeun() {
  print('TODOLIST 프로그램');
  print('1. 목록 보기');
  print('2. 할일 추가');
  print('3. 할일 수정');
  print('4. 완료 상태 체크');
  print('5. 할일 삭제');
  print('0. 종료');

  print('\n');
  print('선택하세요');
}
