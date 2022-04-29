import 'package:park_coding_contest_memo_app/utilities/index.dart';

class RoundedIconButton extends StatelessWidget {
  final int identifier;
  const RoundedIconButton({Key? key, required this.identifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonSource = buttonDefaults[identifier]!;
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: NeumorphicButton(
        style: NeumorphicStyle(
          depth: 4,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
          border: const NeumorphicBorder(
            color: kLBoxBorderColor,
            width: 0.6,
          ),
        ),
        onPressed: () {},
        child: Icon(buttonSource.iconData, color: buttonSource.color),
      ),
    );
  }
}
