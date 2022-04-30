import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class AddEditScreen extends HookWidget {
  final MemoVM memoVM;
  const AddEditScreen({Key? key, required this.memoVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: const Text("메모를 한 글자 이상 입력하세요!"),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: new Text("확인"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              : AlertDialog(
                  title: const Text("메모를 한 글자 이상 입력하세요!"),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: new Text("확인"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
        },
      );
    }

    // State Variables
    final _titleInput = useState<String?>(null);
    final _contentInput = useState<String>("");
    final _isLocked = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FormatDateText(
            date: DateTime.now(), textStyle: FontStyles().dateAppbarTitle),
        actions: [
          /* Lock & Unlock Button */
          Container(
            alignment: Alignment.center,
            child: NeumorphicButton(
              onPressed: () {
                _isLocked.value = !_isLocked.value;
              },
              style: const NeumorphicStyle(
                  depth: 2, boxShape: NeumorphicBoxShape.circle()),
              child: SizedBox(
                height: 22,
                child: Align(
                  child: Icon(
                    _isLocked.value ? Icons.lock_outline : Icons.lock_open,
                    color: _isLocked.value ? kLPinkColor : kLLimeColor,
                  ),
                ),
              ),
            ),
          ),
          /* Edit Save Button */
          Builder(builder: (context) {
            final isContentFilled = _contentInput.value.isNotEmpty;
            return Container(
              alignment: Alignment.center,
              child: NeumorphicButton(
                onPressed: () {
                  if (isContentFilled) {
                    memoVM.addMemo(Memo(
                        title: _titleInput.value,
                        isSecret: _isLocked.value,
                        id: const Uuid(),
                        content: _contentInput.value,
                        date: DateTime.now()));
                    Get.back();
                  } else {
                    _showDialog();
                  }
                },
                style: NeumorphicStyle(
                    depth: isContentFilled ? 2 : 0,
                    boxShape: const NeumorphicBoxShape.circle()),
                child: SizedBox(
                  height: 20,
                  child: Align(
                    child: Text(
                      "저장",
                      style: TextStyle(
                          color: isContentFilled ? kLPurpleColor : Colors.grey),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
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
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      /* Title */
                      TextField(
                        onChanged: (String inputs) {
                          _titleInput.value = inputs;
                        },
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
                        child: Container(
                          margin: EdgeInsets.only(bottom: 300),
                          child: TextFormField(
                            onChanged: (inputs) {
                              _contentInput.value = inputs;
                            },
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                            textInputAction: TextInputAction.newline,
                            minLines: null,
                            maxLines: null,
                            expands: true, // If
                            decoration: const InputDecoration(
                                hintText: "내용을 입력하세요.",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          /* Bottom Indicator */
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: 24 + MediaQuery.of(context).padding.bottom,
                  width: MediaQuery.of(context).size.width,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "글자 수 : ${_contentInput.value.length}",
                          style: TextStyle(
                            color: kLAccentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
