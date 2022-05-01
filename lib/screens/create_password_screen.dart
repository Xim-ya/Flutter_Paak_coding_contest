import 'package:park_coding_contest_memo_app/utilities/index.dart';

class CreatePasswordScreen extends HookWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstPassword = useState<String>("");
    final secondPassword = useState<String>("");

    return Scaffold(
      backgroundColor: kL1BackgroundColor,
      appBar: AppBar(
        leading: const RoundedBackButton(),
        backgroundColor: kL1BackgroundColor,
        centerTitle: true,
        title: const Text(
          "비밀번호 생성",
          style: TextStyle(color: kLAccentColor),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4, top: 40),
            child: Text(
              "비빌번호 입력",
              style: TextStyle(color: kLAccentColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Neumorphic(
              margin:
                  const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
              style:
                  NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
              child: TextField(
                onChanged: (val) {
                  firstPassword.value = val;
                },
                onSubmitted: (value) {},
                cursorColor: kLAccentColor,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "비밀번호 입력"),
              ),
            ),
          ),
          SizedBox(height: 32),
          /* Double Check */
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Text(
              "비밀번호 재확인",
              style: TextStyle(color: kLAccentColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Neumorphic(
              margin:
                  const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
              style:
                  NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
              child: TextField(
                onChanged: (val) {
                  secondPassword.value = val;
                },
                onSubmitted: (value) {},
                cursorColor: kLAccentColor,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "비밀번호 재입력"),
              ),
            ),
          ),
          SizedBox(height: 24),
          /* Submit Button */
          Center(
            child: NeumorphicButton(
              onPressed: () {
                if (firstPassword.value != "" &&
                    firstPassword.value == secondPassword.value) {
                  Box<User> userBox = Hive.box<User>('user');
                  User user = User(
                      password: firstPassword.value, didRegister: true, id: 1);
                  userBox.add(user);
                  Get.back();
                } else {
                  MultipleDialogNSnackBar.wrongPassword(context);
                }
              },
              child: Text(
                "확인",
                style: TextStyle(
                  color: kLAccentColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
