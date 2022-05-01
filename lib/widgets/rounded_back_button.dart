import 'package:park_coding_contest_memo_app/utilities/index.dart';

class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: NeumorphicButton(
        onPressed: () {
          Get.back();
        },
        style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
        child: Center(
          child: NeumorphicIcon(
            Icons.arrow_back,
            style: const NeumorphicStyle(color: kLAccentColor),
            size: 20,
          ),
        ),
      ),
    );
  }
}
