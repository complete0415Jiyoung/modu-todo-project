abstract interface class TodoDataSource {
  Future<void> writeTodo(List<Map<String, dynamic>> todos);
  Future<void> readTodo(Map<String, dynamic> todo);
}
