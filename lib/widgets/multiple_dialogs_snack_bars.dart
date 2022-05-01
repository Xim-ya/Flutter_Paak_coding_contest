import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:park_coding_contest_memo_app/screens/create_password_screen.dart';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MultipleDialogNSnackBar {
  static void showAlertIndicator(BuildContext context) {
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

  static void showLockedInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text("비밀번호 필요"),
                content: const Text("비밀 메모를 생성하기 위해서는 비밀번호를 생성해야 됩니다"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Navigator.pop(context);
                      Get.to(() => CreatePasswordScreen());
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: const Text("비밀번호 필요"),
                content: const Text("비밀 메모를 생성하기 위해서는 비밀번호를 생성해야 됩니다"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Navigator.pop(context);
                      Get.to(() => CreatePasswordScreen());
                    },
                  ),
                ],
              );
      },
    );
  }

  static void wrongPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text("비밀번호 오류"),
                content: const Text("비밀번호가 올바르지 않습니다"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: const Text("비밀번호 오류"),
                content: const Text("비밀번호가 올바르지 않습니다"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showEnterPasswordDialog(
      BuildContext context, Function toDetailScreen) {
    TextEditingController controller = TextEditingController();
    Box<User> userBox = Hive.box<User>('user');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text("비밀번호 입력"),
                content: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: CupertinoTextField(
                    controller: controller,
                    onChanged: (value) {},
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 0.4, color: Colors.grey)),
                  ),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      if (controller.value.text == userBox.getAt(0)!.password) {
                        Navigator.pop(context);
                        toDetailScreen();
                      } else {
                        controller.text = "";
                      }
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: const Text("비밀번호 오류"),
                content: const Text("비밀번호가 올바르지 않습니다"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: new Text("확인"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showSnackBar(BuildContext context, String description) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(description),
      duration: const Duration(seconds: 1),
    ));
  }
}
