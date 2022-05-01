import 'package:park_coding_contest_memo_app/utilities/index.dart';

class SearchScreen extends HookWidget {
  final MemoVM memoVM;
  const SearchScreen({Key? key, required this.memoVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputs = useState<String>(""); // State Variables
    return Scaffold(
      appBar: AppBar(
        leading: const RoundedBackButton(),
        backgroundColor: kL1BackgroundColor,
        elevation: 0,
      ),
      backgroundColor: kL1BackgroundColor,
      body: Column(
        children: [
          SearchBar(memoVM: memoVM, inputs: inputs),
          SearchedMemoList(memoVM: memoVM, inputs: inputs)
        ],
      ),
    );
  }
}

/* Search Bar */
class SearchBar extends StatelessWidget {
  final MemoVM memoVM;
  final ValueNotifier<String> inputs;
  const SearchBar({Key? key, required this.memoVM, required this.inputs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Neumorphic(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
        style: NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
        child: TextField(
          onChanged: (val) {
            inputs.value = val;
          },
          onSubmitted: (value) {},
          cursorColor: kLAccentColor,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "검색어를 입력하세요"),
        ),
      ),
    );
  }
}

/* Searched Memo Item List */
class SearchedMemoList extends StatelessWidget {
  final MemoVM memoVM;
  final ValueNotifier<String> inputs;
  const SearchedMemoList({Key? key, required this.memoVM, required this.inputs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filteredList = memoVM.memoList.values.where((e) {
      return e.title.contains(inputs.value) || e.content.contains(inputs.value);
    }).toList();
    return Expanded(
      child: GetBuilder<MemoVM>(
        init: memoVM,
        builder: (context) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final Memo? memoItem = filteredList[index];
              return MemoItem(
                memoVM: memoVM,
                index: index,
                memo: Memo(
                    isSecret: memoItem!.isSecret,
                    id: memoItem.id,
                    content: memoItem.content,
                    title: memoItem.title,
                    date: memoItem.date),
              );
            },
          );
        },
      ),
    );
  }
}
