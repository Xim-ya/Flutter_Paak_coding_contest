import 'package:park_coding_contest_memo_app/utilities/index.dart';
part 'memo_model.g.dart';

@HiveType(typeId: 1)
class Memo {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final bool isSecret;

  Memo({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.isSecret,
  });
}
