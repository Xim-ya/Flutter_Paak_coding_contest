import 'package:park_coding_contest_memo_app/utilities/index.dart';

class SearchScreen extends StatelessWidget {
  final MemoVM memoVM;
  const SearchScreen({Key? key, required this.memoVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const RoundedBackButton(),
        backgroundColor: kL1BackgroundColor,
        elevation: 0,
      ),
      backgroundColor: kL1BackgroundColor,
      body: Column(
        children: [SearchBar(memoVM: memoVM), SearchedMemoList(memoVM: memoVM)],
      ),
    );
  }
}

/* Search Bar */
class SearchBar extends StatelessWidget {
  final MemoVM memoVM;
  const SearchBar({Key? key, required this.memoVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Neumorphic(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
        style: NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
        child: TextField(
          onChanged: (value) {
            memoVM.searchHandler(value);
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
  const SearchedMemoList({Key? key, required this.memoVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<MemoVM>(
        init: memoVM,
        builder: (context) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: memoVM.searchedMemoList.length,
              itemBuilder: (context, index) {
                final Memo memoItem = memoVM.searchedMemoList[index];
                return MemoItem(
                  memoVM: memoVM,
                  index: index,
                  memo: Memo(
                      isSecret: memoItem.isSecret,
                      id: memoItem.id,
                      content: memoItem.content,
                      title: memoItem.title,
                      date: memoItem.date),
                );
              });
        },
      ),
    );
  }
}
