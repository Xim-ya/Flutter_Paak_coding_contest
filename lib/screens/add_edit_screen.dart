import 'package:park_coding_contest_memo_app/utilities/index.dart';

class AddEditScreen extends HookWidget {
  final MemoVM memoVM;
  final bool isEditApproach;
  const AddEditScreen(
      {Key? key, required this.memoVM, required this.isEditApproach})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // State Variables
    final _titleInput =
        useState<String>(isEditApproach ? memoVM.selectedMemo!.title : "");
    final _contentInput =
        useState<String>(isEditApproach ? memoVM.selectedMemo!.content : "");
    final _isLocked =
        useState<bool>(isEditApproach ? memoVM.selectedMemo!.isSecret : false);
    final _canEdit = useState<bool>(isEditApproach ? false : true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            print(memoVM.selectedMemo!.content);
          },
          child: FormatDateText(
              date: DateTime.now(), textStyle: FontStyles().dateAppbarTitle),
        ),
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
            final Memo handledMemo = Memo(
                title: _titleInput.value,
                isSecret: _isLocked.value,
                id: 4,
                content: _contentInput.value,
                date: DateTime.now());
            final isContentFilled = _contentInput.value.isNotEmpty;
            return isEditApproach
                ? EditSaveToggleButton(canEdit: _canEdit, memo: handledMemo)
                : Container(
                    alignment: Alignment.center,
                    child: NeumorphicButton(
                      onPressed: () {
                        if (isContentFilled) {
                          memoVM.addMemo(handledMemo);
                          Get.back();
                        } else {
                          MultipleAlertDialogs.addEventDialog(context);
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
                                color: isContentFilled
                                    ? kLPurpleColor
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  );
          }),
        ],
        leading: const RoundedBackButton(),
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
                      TextFormField(
                        enabled: _canEdit.value,
                        initialValue: _titleInput.value,
                        onChanged: (String inputs) {
                          _titleInput.value = inputs;
                        },
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        cursorColor: kLAccentColor,
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
                            enabled: _canEdit.value,
                            initialValue: isEditApproach
                                ? memoVM.selectedMemo!.content
                                : "",
                            onChanged: (inputs) {
                              _contentInput.value = inputs;
                            },
                            cursorColor: kLAccentColor,
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
