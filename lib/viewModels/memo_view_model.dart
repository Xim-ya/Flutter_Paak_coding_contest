import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoVM extends GetxController {
  /* Model과 연동 */
  final MemoCore _model;
  MemoVM({required MemoCore model}) : _model = model;

  List<Memo> get memoList {
    return _model.memoList;
  }
}
