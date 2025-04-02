import 'dart:convert';
import 'dart:io';

import 'package:todo_app/data_source/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final filePath = '';

  @override
  Future<void> readTodo(Map<String, dynamic> todo) async {
    try {
      final File jsonFile = File(filePath);
      String jsonFromFile = await jsonFile.readAsString();

      return jsonDecode(jsonFromFile);
    } on FileSystemException {
      throw FormatException('JSON 파싱오류');
    } catch (e) {
      print('예상치 못한 오류발생 :$e');
    }
  }

  @override
  Future<void> writeTodo(List<Map<String, dynamic>> todos) {
    // TODO: implement writeTodo
    throw UnimplementedError();
  }
}
