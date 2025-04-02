import 'package:todo_app/data_source/todo_data_source_impl.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

class TodoView{
  final TodoRepository todoRepository = TodoRepositoryImpl (
    TodoDataSourceImpl(),
  );
  todoRepository.getTodos();
}
class TodoListView{

  void listView() async{
  print('[할 일 목록]');
  final TodoRepository todoRepository = TodoRepositoryImpl(
  TodoDataSourceImpl(),
  );
  print(await todoRepository.getTodos());
}


}