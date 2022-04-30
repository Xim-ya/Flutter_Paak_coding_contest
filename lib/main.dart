import 'package:park_coding_contest_memo_app/utilities/index.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(const MyApp());
}

// Device Preview 셋업 (반응형 확인)
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memo App',
      theme: ThemeData(backgroundColor: kL1BackgroundColor),
      themeMode: ThemeMode.light,
      home: MainScreen(),
    );
  }
}
