import 'package:test/test.dart';
import 'package:todo_app/data_source/mock_todo_data_source_impl.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

void main() {
  final mockTodoDatasourceImpl = MockTodoDatasourceImpl();
  final todoRepository = TodoRepositoryImpl(mockTodoDatasourceImpl);

  group('TODOLIST', () {
    test('목록보기_날짜오름차순', () async {
      final todos = await todoRepository.getTodos();
      todos.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      for (int i = 0; i < todos.length - 1; i++) {
        expect(todos[i].createdAt.isBefore(todos[i + 1].createdAt), isTrue);
      }
    });

    test('목록보기_날짜내림차순', () async {
      final todos = await todoRepository.getTodos();
      todos.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      for (int i = 0; i < todos.length - 1; i++) {
        expect(todos[i].createdAt.isAfter(todos[i + 1].createdAt), isTrue);
      }
    });

    test('목록보기_완료목록', () async {
      final todos = await todoRepository.getTodos();
      todos.retainWhere((e) => e.completed == true);
      expect(todos.isNotEmpty, isTrue);
      for (var todo in todos) {
        expect(todo.completed, isTrue);
      }
    });

    test('목록보기_미완료목록', () async {
      final todos = await todoRepository.getTodos();
      todos.retainWhere((e) => e.completed == false);

      expect(todos.isNotEmpty, isTrue);
      for (var todo in todos) {
        expect(todo.completed, isFalse);
      }
    });
  });
}
