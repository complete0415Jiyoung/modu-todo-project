import 'dart:io';

import 'package:todo_app/log_service.dart';
import 'package:todo_app/view/todo_view.dart';

void main() async {
  bool isFlag = true;

  LogService logFile = LogService('${Directory.current.path}/log.txt');

  await logFile.log('앱 시작됨');

  while (isFlag) {
    printMeun();

    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        await TodoView().listView(logFile);
        break;
      case '2':
        print('할 일 추가');
        await TodoView().addView(logFile);
        break;
      case '3':
        print('할 일 수정');
        await TodoView().updateView(logFile);
        break;
      case '4':
        print('완료 상태 체크');
        await TodoView().toggleView(logFile);
        break;
      case '5':
        print('할 일 삭제');
        await TodoView().deleteView(logFile);
        break;
      case '0':
        print('종료');
        await logFile.log('앱 종료됨');
        isFlag = false;
        break;
      default:
        await logFile.log('에러발생 : 올바른 메뉴 버튼을 입력해주세요');
    }
  }
}

void printMeun() {
  print('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
  print('|          📝 TO-DO LIST          |');
  print('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
  print('\n  번호/항목 \n');
  print('   1️⃣  👀 목록 보기        \n');
  print('   2️⃣  ➕ 할 일 추가       \n');
  print('   3️⃣  ✏️  할 일 수정       \n');
  print('   4️⃣  ✅ 완료 상태 체크    \n');
  print('   5️⃣  🗑️  할 일 삭제       \n');
  print('   0️⃣  🚪 종료            \n');

  print('==================================');
  print('💡원하는 메뉴(번호)를 입력하세요');
}
