import 'package:park_coding_contest_memo_app/utilities/index.dart';

class EditSaveToggleButton extends StatelessWidget {
  final MemoVM memoVM;
  final ValueNotifier<bool> canEdit;
  final Memo memo;
  const EditSaveToggleButton(
      {Key? key,
      required this.canEdit,
      required this.memo,
      required this.memoVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: NeumorphicButton(
        onPressed: () {
          if (canEdit.value) {
            if (memo.content.isEmpty) {
              MultipleDialogNSnackBar.showAlertIndicator(context);
            } else {
              memoVM.updateMemo(memo);
              print(memo.title);
              MultipleDialogNSnackBar.showSnackBar(context, "수정 완료!");
            }
          } else {
            canEdit.value = true;
            MultipleDialogNSnackBar.showSnackBar(context, "수정 모드");
          }
        },
        style: const NeumorphicStyle(
            depth: 2, boxShape: NeumorphicBoxShape.circle()),
        child: SizedBox(
          height: 20,
          child: Align(
            child: Text(
              canEdit.value ? "완료" : "편집",
              style: TextStyle(color: canEdit.value ? kLOrange : kLPurpleColor),
            ),
          ),
        ),
      ),
    );
  }
}
