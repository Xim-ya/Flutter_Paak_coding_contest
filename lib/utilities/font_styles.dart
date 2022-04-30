import 'package:flutter/material.dart';
import 'package:park_coding_contest_memo_app/utilities/palette.dart';

class FontStyles {
  double? size;
  bool? isMobile;

  FontStyles([this.size, this.isMobile])
      /*  MainScreen  */
      : memoDate = const TextStyle(
          color: kLSubTextColor,
        ),
        appBarTitle = const TextStyle(
            color: kLAccentColor, fontSize: 18, fontWeight: FontWeight.bold),
        memoTitle = const TextStyle(
            color: kLAccentColor, fontSize: 16, fontWeight: FontWeight.bold),
        memoContentText = const TextStyle(color: kLSubTextColor),
        dateAppbarTitle = const TextStyle(color: kLSubTextColor, fontSize: 13);

  late final TextStyle memoDate;
  late final TextStyle memoTitle;
  late final TextStyle appBarTitle;
  late final TextStyle memoContentText;
  late final TextStyle dateAppbarTitle;
}
