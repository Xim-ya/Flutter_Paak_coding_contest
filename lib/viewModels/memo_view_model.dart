import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoVM extends GetxController {
  /* Connect to Model */
  MemoCore _model;
  MemoVM({required MemoCore model}) : _model = model;

  /* Instance */
  List<Memo> get memoList {
    return _model.memoList;
  }

  /* Intents */
  void addMemo(Memo memo) {
    _model.addMemo(memo);
    update();
  }
}
