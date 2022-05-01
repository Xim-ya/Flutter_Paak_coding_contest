import 'package:park_coding_contest_memo_app/utilities/index.dart';
import 'package:park_coding_contest_memo_app/widgets/multiple_alert_dialogs.dart';

class EditSaveToggleButton extends StatelessWidget {
  final ValueNotifier<bool> canEdit;
  final Memo memo;
  const EditSaveToggleButton(
      {Key? key, required this.canEdit, required this.memo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: NeumorphicButton(
        onPressed: () {
          if (canEdit.value) {
            // 수정 가능 "완료"
            if (memo.content.isEmpty) {
              MultipleAlertDialogs.addEventDialog(context);
            } else {
              canEdit.value = false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("수정 완료!"),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          } else {
            canEdit.value = true;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("수정 모드"),
                duration: Duration(seconds: 1),
              ),
            );
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
