import 'package:chat_app_samp/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';



// TODO1 : dev/master ブランチをcloneし、自分の作業ブランチを分岐させてください。
//         ①ワーキングディレクトリは /Users/自分のユーザー名/Documents/flutter_class 指定します。
//         ②命名規則は「dev/feature/あなたの名前」 ロアスネークケースです。
// TODO2 : このファイルの内容を対象の行にコメントを各々追記してください、
// TODO3 : プッシュして、他のメンバーが作成したブランチとマージ作業を行います。[※説明があるまで進めないでください]

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 環境変数をロード
  await dotenv.load(fileName: ".env");

  // Firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // App Checkを初期化
  // await FirebaseAppCheck.instance.activate();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      debugPrint("--起動-${DateTime.now()}-");
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAFATO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "NotoSansJP", // font対応
      ),
      // インデックス画面へ遷移
      home: LoginScreen(),

      // LoginScreen(),

      // CalculateScreen(),
    );
  }
}
