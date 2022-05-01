import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoVM extends GetxController {
  /* State Variables */
  int? selectedId;
  List<Memo> searchedMemoList = [];

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

  void groupButtonActions(int id, MemoVM? memoVM) {
    switch (id) {
      case 0:
        print("delete Actions");
        break;
      case 1:
        print("delete Actions");
        break;
      case 2:
        Get.to(() => SearchScreen(memoVM: memoVM!));
        break;
    }
  }

  void searchHandler(String inputs) {
    List<Memo> tempSearchedList = <Memo>[];
    tempSearchedList.addAll(_model.memoList);
    if (inputs.isNotEmpty) {
      List<Memo> dummyListData = <Memo>[];
      for (var item in tempSearchedList) {
        if (item.content.contains(inputs) || item.title.contains(inputs)) {
          dummyListData.add(item);
        }
      }
      searchedMemoList.clear();
      searchedMemoList.addAll(dummyListData);
      update();
      return;
    } else {
      searchedMemoList.clear();
      searchedMemoList.addAll(_model.memoList);
      update();
    }
  }
}
