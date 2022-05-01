import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoAnimationBuilder extends StatelessWidget {
  final BuildContext context;
  final int index;
  final Animation<double> animation;
  final MemoVM memoVM;
  const MemoAnimationBuilder(
      {Key? key,
      required this.context,
      required this.index,
      required this.animation,
      required this.memoVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedMemo = memoVM.memoList.getAt(index);
    void someAction(BuildContext context) {
      print("AIM");
      memoVM.deleteMemo(selectedMemo!.id);
    }

    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            // dismissible: DismissiblePane(onDismissed: () {
            //   memoVM.deleteMemo(selectedMemo!.id);
            // }),
            children: [
              SlidableAction(
                onPressed: someAction,
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: '삭제',
              ),
            ],
          ),
          child: MemoItem(
              memoVM: memoVM,
              index: index,
              memo: Memo(
                  isSecret: selectedMemo!.isSecret,
                  date: selectedMemo.date,
                  id: selectedMemo.id,
                  content: selectedMemo.content,
                  title: selectedMemo.title)),
        ),
      ),
    );
  }
}
