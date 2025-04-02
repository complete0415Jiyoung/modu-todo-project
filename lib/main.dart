import 'package:todo_app/data_source/todo_data_source.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';
import 'data_source/todo_data_source_impl.dart';

void main() async {
  final TodoRepository todoRepository = TodoRepositoryImpl(
    TodoDataSourceImpl(),
  );
  print(await todoRepository.getTodos());
}
