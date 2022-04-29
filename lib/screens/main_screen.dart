import 'package:park_coding_contest_memo_app/utilities/index.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () {},
        child: Container(
          child: Icon(Icons.add),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          MainScreenAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Icon Group Button */
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        RoundedIconButton(
                            identifier: 0, icon: Icons.favorite_border),
                        RoundedIconButton(
                            identifier: 1, icon: Icons.favorite_border),
                        RoundedIconButton(
                            identifier: 2, icon: Icons.favorite_border),
                      ],
                    ),
                  ),
                  /* Memo List  */
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      /* Memo Item */
                      return NeumorphicButton(
                        style: NeumorphicStyle(
                          border: NeumorphicBorder(
                            color: kLBoxBorderColor,
                            width: 0.5,
                          ),
                        ),
                        onPressed: () {},
                        margin: EdgeInsets.only(bottom: 20),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 8, bottom: 8),
                          width: double.infinity,
                          height: 76,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "2022.01.29",
                                  style: FontStyles().memoDate,
                                ),
                              ), // Date
                              Text("제목이 들어가는 부분 입니다",
                                  style: FontStyles().memoTitle), // Title
                              Text("내용이 들어갑니다. 내용이 들어갑니다.내용이 들어갑니다. 내용이 들어갑니다",
                                  maxLines: 1,
                                  style: FontStyles().memoContentText)
                            ],
                          ),
                        ),
                      );
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
