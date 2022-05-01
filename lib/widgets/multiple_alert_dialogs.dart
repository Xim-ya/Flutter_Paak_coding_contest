import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MultipleAlertDialogs {
  static void addEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text("메모를 한 글자 이상 입력하세요!"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: const Text("메모를 한 글자 이상 입력하세요!"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
      },
    );
  }
}
