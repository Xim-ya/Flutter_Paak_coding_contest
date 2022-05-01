import 'package:park_coding_contest_memo_app/utilities/index.dart';

class SaveCompleteToggleButton extends StatelessWidget {
  final MemoVM memoVM;
  final bool isContentFilled;
  final Memo handledMemo;
  const SaveCompleteToggleButton(
      {Key? key,
      required this.memoVM,
      required this.isContentFilled,
      required this.handledMemo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: NeumorphicButton(
        onPressed: () {
          if (isContentFilled) {
            memoVM.addMemo(handledMemo);
            Get.back();
          } else {
            MultipleDialogNSnackBar.showAlertIndicator(context);
          }
        },
        style: NeumorphicStyle(
            depth: isContentFilled ? 2 : 0,
            boxShape: const NeumorphicBoxShape.circle()),
        child: SizedBox(
          height: 20,
          child: Align(
            child: Text(
              "저장",
              style: TextStyle(
                  color: isContentFilled ? kLPurpleColor : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
