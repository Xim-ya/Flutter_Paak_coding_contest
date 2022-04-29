import 'package:park_coding_contest_memo_app/utilities/index.dart';

/* Group Button Defaults (MainScreen > GroupButton)  */
final Map<int, ButtonSource> buttonDefaults = {
  0: ButtonSource(
      color: kLPurpleColor, iconData: Icons.delete_outline, action: () {}),
  1: ButtonSource(
      color: kLPinkColor, iconData: Icons.favorite_border, action: () {}),
  2: ButtonSource(color: kLLimeColor, iconData: Icons.search, action: () {})
};
