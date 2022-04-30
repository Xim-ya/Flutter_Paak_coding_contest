import 'package:park_coding_contest_memo_app/utilities/index.dart';

class AddEditScreen extends StatelessWidget {
  const AddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: NeumorphicButton(
            onPressed: () {
              Get.back();
            },
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: Center(
              child: NeumorphicIcon(
                Icons.arrow_back,
                style: const NeumorphicStyle(color: kLAccentColor),
                size: 20,
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  /* Title */
                  TextField(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "제목을 입력하세요(선택)",
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kLAccentColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),

                  /* MemoContent */
                  Flexible(
                    child: TextFormField(
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      minLines: null,
                      maxLines: null,
                      expands: true, // If
                      decoration: const InputDecoration(
                          hintText: "내용을 입력하세요.", border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
