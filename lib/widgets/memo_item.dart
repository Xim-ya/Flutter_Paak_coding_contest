import 'dart:ui';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MemoItem extends StatelessWidget {
  final MemoVM memoVM;
  final Memo memo;
  final int index;
  const MemoItem(
      {Key? key, required this.memoVM, required this.index, required this.memo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          NeumorphicButton(
            style: const NeumorphicStyle(
              color: kL1BackgroundColor,
              depth: 4,
              border: NeumorphicBorder(
                color: kLBoxBorderColor,
                width: 0.6,
              ),
            ),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            onPressed: () {
              memoVM.selectedId = memo.id;
              Get.to(() => AddEditScreen(memoVM: memoVM, isEditApproach: true));
            },
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
                      child: FormatDateText(
                        date: memo.date,
                        textStyle: FontStyles().memoDate,
                      )), // Date
                  Text(memo.title == "" ? "제목이 없습니다" : memo.title,
                      style: FontStyles().memoTitle), // Title
                  Text(memo.content,
                      maxLines: 1, style: FontStyles().memoContentText)
                ],
              ),
            ),
          ),
          false
              ? Positioned(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.8, sigmaY: 2.8),
                        child: Container(
                          padding: EdgeInsets.only(left: 12),
                          height: 110,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.lock, color: kLAccentColor),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text("비밀 메모 입니다",
                                    style: FontStyles().lockIndicatorText),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
