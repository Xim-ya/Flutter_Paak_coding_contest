import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int listItemCount = 20;
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          /* App Bar */
          const MainScreenAppBar(),
          /* Memo List */
          LiveSliverList(
              controller: scrollController,
              showItemDuration: listShowItemDuration,
              itemCount: listItemCount,
              itemBuilder: (context, index, animation) {
                return MemoAnimationBuilder(
                    context: context, index: index, animation: animation);
              }),
        ],
      ),
    );
  }
}
