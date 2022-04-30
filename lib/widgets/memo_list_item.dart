import 'package:intl/intl.dart';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoItem extends StatelessWidget {
  final Memo memo;
  const MemoItem({Key? key, required this.memo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: NeumorphicButton(
        style: const NeumorphicStyle(
          depth: 4,
          border: NeumorphicBorder(
            color: kLBoxBorderColor,
            width: 0.6,
          ),
        ),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        onPressed: () {},
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
          width: double.infinity,
          height: 76,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Builder(builder: (context) {
                  String formatDate =
                      DateFormat("yyyy년 MM월 dd일").format(memo.date);

                  return Text(
                    formatDate,
                    style: FontStyles().memoDate,
                  );
                }),
              ), // Date
              Text(memo.title ?? "제목이 없습니다",
                  style: FontStyles().memoTitle), // Title
              Text(memo.content,
                  maxLines: 1, style: FontStyles().memoContentText)
            ],
          ),
        ),
      ),
    );
  }
}
