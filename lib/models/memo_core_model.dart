import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoCore {
  Box<Memo> memoList = Hive.box<Memo>('memo');

  /* Intent */
  void deleteMemo(int id) {
    if (memoList.length <= 1) {
      memoList.clear();
    } else {
      memoList.delete(id);
    }
  }

  void addMemo(Memo memo) {
    memoList.add(memo);
  }

  void updateMemo(Memo memo) {
    memoList.put(memo.id, memo);
  }

  void deleteAllMemo() {
    memoList.clear();
  }
}
