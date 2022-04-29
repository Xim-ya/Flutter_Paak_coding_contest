import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MainScreenAppBar extends StatelessWidget {
  const MainScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.3,
      floating: false,
      pinned: true,
      expandedHeight: 120,
      backgroundColor: NeumorphicTheme.baseColor(context),
      flexibleSpace: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            child: FlexibleSpaceBar(
                title: Text(
              "메모",
              style: FontStyles().appBarTitle,
            )),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 100, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                RoundedIconButton(identifier: 0),
                RoundedIconButton(identifier: 1),
                RoundedIconButton(identifier: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
