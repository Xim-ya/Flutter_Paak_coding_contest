import 'package:park_coding_contest_memo_app/utilities/index.dart';

class RoundedIconButton extends StatelessWidget {
  final int identifier;
  final MemoVM memoVM;
  const RoundedIconButton(
      {Key? key, required this.identifier, required this.memoVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonSource = buttonDefaults[identifier]!;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: NeumorphicButton(
        style: NeumorphicStyle(
          depth: 4,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
          border: const NeumorphicBorder(
            color: kLBoxBorderColor,
            width: 0.6,
          ),
        ),
        onPressed: () {
          memoVM.groupButtonActions(identifier, memoVM);
        },
        child: Icon(buttonSource.iconData, color: buttonSource.color),
      ),
    );
  }
}
