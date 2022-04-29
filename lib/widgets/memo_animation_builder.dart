import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoAnimationBuilder extends StatelessWidget {
  final BuildContext context;
  final int index;
  final Animation<double> animation;
  const MemoAnimationBuilder(
      {Key? key,
      required this.context,
      required this.index,
      required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: MemoItem(),
        ),
      ),
    );
  }
}
