abstract interface class TodoDataSource {
  Future<void> writeTodo(List<Map<String, dynamic>> todos);
  Future<void> readTodo();
}
