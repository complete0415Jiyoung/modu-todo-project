import 'dart:convert';
import 'dart:io';

import 'package:todo_app/data_source/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final filePath = '${Directory.current.path}/lib/json_data/todo_data.json';

  @override
  Future<List<dynamic>> readTodo() async {
    try {
      final File jsonFile = File(filePath);
      String jsonFromFile = await jsonFile.readAsString();

      return jsonDecode(jsonFromFile);
    } on FileSystemException {
      throw FormatException('JSON 파싱오류');
    } catch (e) {
      print('예상치 못한 오류발생 :$e');
      return [];
    }
  }

  @override
  Future<void> writeTodo(List<Map<String, dynamic>> todos) async {
    try {
      final File jsonFile = File(filePath);
    } catch (e) {}
  }
}
