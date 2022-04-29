import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoItem extends StatelessWidget {
  const MemoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: const NeumorphicStyle(
        border: NeumorphicBorder(
          color: kLBoxBorderColor,
          width: 0.5,
        ),
      ),
      onPressed: () {},
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        width: double.infinity,
        height: 76,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Text(
                "2022.01.29",
                style: FontStyles().memoDate,
              ),
            ), // Date
            Text("제목이 들어가는 부분 입니다", style: FontStyles().memoTitle), // Title
            Text("내용이 들어갑니다. 내용이 들어갑니다.내용이 들어갑니다. 내용이 들어갑니다",
                maxLines: 1, style: FontStyles().memoContentText)
          ],
        ),
      ),
    );
  }
}
