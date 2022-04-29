import 'package:park_coding_contest_memo_app/utilities/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Memo App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: kLBackgroundColor,
        accentColor: kLAccentColor,
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: kDBackgroundColor,
        accentColor: kDAccentColor,
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MainScreen(),
    );
  }
}
