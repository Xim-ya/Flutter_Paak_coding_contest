import 'package:park_coding_contest_memo_app/utilities/index.dart';

class LockUnLockToggleButton extends StatelessWidget {
  final ValueNotifier<bool> isLocked;

  const LockUnLockToggleButton({
    Key? key,
    required this.isLocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: NeumorphicButton(
        onPressed: () {
          Box<User> user = Hive.box<User>('user');

          if (user.isEmpty) {
            MultipleDialogNSnackBar.showLockedInfoDialog(context);
          } else {
            if (isLocked.value) {
              isLocked.value = false;
              MultipleDialogNSnackBar.showSnackBar(context, "비밀 해제");
            } else {
              isLocked.value = true;
              MultipleDialogNSnackBar.showSnackBar(context, "비밀 메모로 전환!");
            }
          }
        },
        style: const NeumorphicStyle(
            depth: 2, boxShape: NeumorphicBoxShape.circle()),
        child: SizedBox(
          height: 22,
          child: Align(
            child: Icon(
              isLocked.value ? Icons.lock_outline : Icons.lock_open,
              color: isLocked.value ? kLPinkColor : kLLimeColor,
            ),
          ),
        ),
      ),
    );
  }
}
