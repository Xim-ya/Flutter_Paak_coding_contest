import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoCore {
  final List<Memo> memoList = memoItems;

  void addMemo(Memo memo) {
    memoList.add(memo);
  }
}

class Memo {
  final Uuid id;
  final String? title;
  final String content;
  final DateTime date;

  final bool isSecret;

  Memo({
    required this.id,
    this.title,
    required this.content,
    required this.date,
    required this.isSecret,
  });
}
