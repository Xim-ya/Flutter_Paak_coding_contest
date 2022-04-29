import 'package:park_coding_contest_memo_app/utilities/index.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final int listItemCount = 4;
    final Duration listShowItemDuration = Duration(milliseconds: 250);
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const MainScreenAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Icon Group Button */
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        RoundedIconButton(identifier: 0),
                        RoundedIconButton(identifier: 1),
                        RoundedIconButton(identifier: 2),
                      ],
                    ),
                  ),
                  /* Memo List  */

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      /* Memo Item */
                      return MemoItem();
                    },
                  )
                ],
              ),
            ]), //SliverChildListDelegate
          ), //SliverList
        ], //sliver Widgets
      ), //customSc
    );
  }
}
