import 'package:park_coding_contest_memo_app/utilities/index.dart';

/* Group Button Defaults (MainScreen > GroupButton)  */
final Map<int, ButtonSource> buttonDefaults = {
  0: ButtonSource(
      color: kLPurpleColor, iconData: Icons.delete_outline, action: () {}),
  1: ButtonSource(
      color: kLPinkColor, iconData: Icons.favorite_border, action: () {}),
  2: ButtonSource(color: kLLimeColor, iconData: Icons.search, action: () {})
};

/* Animation Controller & Source  (MainScreen > MemoList)*/
final scrollController = ScrollController();
const Duration listShowItemDuration = Duration(milliseconds: 250);

/* Memo Sample Data (MainScreen > MemoList) */
// final List<Memo> memoItems = [
//   Memo(
//     id: 0,
//     title: "제목1",
//     content: "내용이 들어갑니다1, 내용이 들어갑니다1, 내용이 들어갑니다1, 내용이 들어갑니다1",
//     date: DateTime.now(),
//     isSecret: false,
//   ),
//   Memo(
//     id: 1,
//     title: '',
//     content: "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ",
//     date: DateTime.now(),
//     isSecret: true,
//   ),
//   Memo(
//     id: 2,
//     title: "제목3",
//     content: "내용이 들어갑니다1, 내용이 들어갑니다3, 내용이 들어갑니다3, 내용이 들어갑니다1",
//     date: DateTime.now(),
//     isSecret: false,
//   ),
// ];
