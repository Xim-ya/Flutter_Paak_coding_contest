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
    final Memo selectedItem = memoVM.memoList[index];
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
            dismissible: DismissiblePane(onDismissed: () {}),
            children: const [
              SlidableAction(
                onPressed: null,
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: '삭제',
              ),
            ],
          ),
          child: MemoItem(
              memo: Memo(
                  isSecret: selectedItem.isSecret,
                  isFavorite: selectedItem.isFavorite,
                  title: selectedItem.title,
                  content: selectedItem.content,
                  date: selectedItem.date,
                  id: selectedItem.id)),
        ),
      ),
    );
  }
}
