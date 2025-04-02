import 'package:test/test.dart';
import 'package:todo_app/data_source/mock_todo_data_source_impl.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

void main() {
  final TodoRepository todoRepository = TodoRepositoryImpl(
    MockTodoDatasourceImpl(),
  );

  group('할 일 수정 TEST', () {
    test('🍔 정상적인 수정이 되는지 확인', () async {
      // Given
      final int id = 1;
      final newTitle = 'Test';

      // When, Then
      todoRepository.updateTodo(id, newTitle);
    });

    test('🍟 잘못된 ID 입력시 예외 처리', () async {
      // Given
      final int id = 99;
      final String newTitle = 'Test';

      // When, Then
      todoRepository.updateTodo(id, newTitle);
    });

    test('🍟 빈 제목 입력 시 처리 확인', () async {
      // Given
      final int id = 1;
      final String newTitle = '';

      // When, Then
      todoRepository.updateTodo(id, newTitle);
    });
  });

  group('ID 자동 증가', () {
    test('🍔 ID 증가 확인', () async {
      //Given
      final int id = 3;

      // When, Then
      todoRepository.deleteTodo(id);
    });
  });
}
