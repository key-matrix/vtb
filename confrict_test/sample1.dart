import 'package:chat_app_samp/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';



// TODO1 : dev/master ブランチをcloneし、自分の作業ブランチを分岐させてください。
//         ①ワーキングルートディレクトリは /Users/自分の名前/development/flutter_class 指定
//         ②命名規則は「dev/feature/あなたの名前」 ロアスネークケースです。
// TODO2 : このファイルの内容を対象の行にコメントを各々追記してください、
// TODO3 : プッシュして、他のメンバーが作成したブランチとマージ作業を行います。[※説明があるまで進めないでください]


// エンポリーポイント

void main() async {
  // Flutterの初期化
  WidgetsFlutterBinding.ensureInitialized();

  // 環境変数をロード
  await dotenv.load(fileName: ".env");

  // Firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // App Checkを初期化
  await FirebaseAppCheck.instance.activate();

  // ProviderScope(権限)をアプリ全体に付与
  // MyAppを起動する
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// ステートレスウィジェットのMyAppクラスの定義
class MyApp extends StatelessWidget {
  // MyAppのコンストラクタ
  const MyApp({super.key});
  
  @override
  // buildメソッドの定義
  Widget build(BuildContext context) {
    // デバッグモードの場合、起動時の日時を出力する
    if (kDebugMode) {
      debugPrint("--起動-${DateTime.now()}-");
    }
    // MaterialAppを返す
    return MaterialApp(
      // デバッグモードのバナーを非表示にする
      debugShowCheckedModeBanner: false,
      // アプリのタイトルをCHAFATOに設定
      title: 'CHAFATO',
      // アプリのテーマを設定
      theme: ThemeData(
        // プライマリカラーを青に設定
        primarySwatch: Colors.blue,
        // フォントを設定
        fontFamily: "NotoSansJP", // font対応
      ),
      // インデックス画面へ遷移
      home: LoginScreen(),

      // LoginScreen(),

      // CalculateScreen(),
    );
  }
}
