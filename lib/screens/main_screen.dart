import 'package:park_coding_contest_memo_app/screens/add_edit_screen.dart';
import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MainScreen extends StatelessWidget {
  // const MainScreen({Key? key}) : super(key: key);

  final _memoVM = Get.put(MemoVM(model: MemoCore()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: NeumorphicTheme.baseColor(context),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () {
          Get.to(() => const AddEditScreen());
        },
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
              itemCount: _memoVM.memoList.length,
              itemBuilder: (context, index, animation) {
                return Column(
                  children: [
                    MemoAnimationBuilder(
                        context: context,
                        index: index,
                        animation: animation,
                        memoVM: _memoVM),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
