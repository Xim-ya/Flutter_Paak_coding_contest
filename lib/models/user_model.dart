import 'package:park_coding_contest_memo_app/utilities/index.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0, defaultValue: 32)
  final int id;

  @HiveField(1, defaultValue: false)
  final bool didRegister;

  @HiveField(2)
  final String password;

  User({required this.password, required this.didRegister, required this.id});
}
