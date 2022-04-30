import 'package:intl/intl.dart';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class FormatDateText extends StatelessWidget {
  final TextStyle textStyle;
  final DateTime date;
  const FormatDateText({Key? key, required this.textStyle, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatDate = DateFormat("yyyy년 MM월 dd일").format(date);
    return Text(formatDate, style: textStyle);
  }
}
