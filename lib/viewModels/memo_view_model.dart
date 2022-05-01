import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoVM extends GetxController {
  /* State Variables */
  int? selectedId;

  /* Connect to Model */
  MemoCore _model;
  MemoVM({required MemoCore model}) : _model = model;

  /* Instance */
  List<Memo> get memoList {
    return _model.memoList;
  }

  Memo? get selectedMemo {
    final memo = _model.memoList.firstWhereOrNull((e) => e.id == selectedId);
    return memo;
  }

  /* Intents */
  void addMemo(Memo memo) {
    _model.addMemo(memo);
    update();
  }
}
