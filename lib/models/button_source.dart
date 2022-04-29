import 'package:park_coding_contest_memo_app/utilities/index.dart';

class ButtonSource {
  final IconData iconData;
  final Color color;
  final VoidCallback action;

  ButtonSource(
      {required this.iconData, required this.color, required this.action});
}
