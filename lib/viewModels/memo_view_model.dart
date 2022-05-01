import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoVM extends GetxController {
  /* State Variables */
  int? selectedId;
  List<Memo> searchedMemoList = [];

  /* Connect to Model */
  final MemoCore _model;
  MemoVM({required MemoCore model}) : _model = model;

  /* Instance */
  Box<Memo> get memoList {
    return _model.memoList;
  }

  Memo? get selectedMemo {
    final memo = _model.memoList.get(selectedId);
    return memo;
  }

  /* Intents */
  void addMemo(Memo memo) {
    _model.addMemo(memo);
    update();
  }

  void deleteMemo(int id) {
    _model.deleteMemo(id);
    update();
  }

  void updateMemo(Memo memo) {
    _model.updateMemo(memo);
    update();
  }

  void deleteAllMemo() {
    _model.deleteAllMemo();
    update();
  }

  void groupButtonActions(int id, MemoVM? memoVM) {
    switch (id) {
      case 0:
        deleteAllMemo();
        break;
      case 1:
        break;
      case 2:
        Get.to(() => SearchScreen(memoVM: memoVM!));
        break;
    }
  }

  void route() {}

  @override
  void onInit() async {
    super.onInit();
  }
}
