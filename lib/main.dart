import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_skeleton/models/user_model.dart';
import 'package:flutter_skeleton/utils/app_router.dart';
import 'package:flutter_skeleton/utils/custom_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(const MainApp());
}

// 모델
UserModel userModel = UserModel();

// 라우터
final _router = AppRouter.getRouter(userModel);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: CustomThemeData.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
