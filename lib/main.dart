import 'dart:io';

import 'package:todo_app/view/todo_view.dart';

void main() async {
  bool isFlag = true;

  while (isFlag) {
    printMeun();

    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        await TodoView().listView();
        break;
      case '2':
        print('할 일 추가');
        await TodoView().addView();
        break;
      case '3':
        print('할 일 수정');
        await TodoView().updateView();
        break;
      case '4':
        print('완료 상태 체크');
        await TodoView().toggleView();
        break;
      case '5':
        print('할 일 삭제');
        await TodoView().deleteView();
        break;
      case '0':
        print('종료');
        isFlag = false;
        break;
      default:
        print('똑바로해');
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
  print('   6️⃣  🗑️  할 일 삭제       \n');
  print('   0️⃣  🚪 종료            \n');

  print('==================================');
  print('💡원하는 메뉴(번호)를 입력하세요');
}
