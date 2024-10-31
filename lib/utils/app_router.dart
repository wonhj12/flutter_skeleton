import 'package:flutter_skeleton/components/system/bottom_navbar.dart';
import 'package:flutter_skeleton/models/user_model.dart';
import 'package:flutter_skeleton/view_models/home_view_model.dart';
import 'package:flutter_skeleton/view_models/login_view_model.dart';
import 'package:flutter_skeleton/views/home_view.dart';
import 'package:flutter_skeleton/views/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  AppRouter();

  static GoRouter getRouter(
    UserModel userModel,
  ) {
    return GoRouter(
      initialLocation: '/login',
      redirect: (context, state) {
        // 사용자 데이터가 있으면 firebase 로그인이 완료된 상태
        // 사용자 데이터가 없으면 로그인 화면으로 이동, 있으면 홈 화면으로 이동
        if (userModel.name == null) {
          // 회원가입 페이지로 이동만 허용
          if (state.fullPath == '/login/signup') {
            return null;
          }

          // 로그인이 되지 않은 상태에서 다른 페이지로 이동하려 하면 login 페이지로 리디렉팅
          return '/login';
        } else if (state.fullPath == '/login') {
          // 로그인이 됐으면 home 페이지로 리디렉팅
          return '/home';
        } else {
          return null;
        }
      },
      routes: [
        // 로그인
        GoRoute(
          path: '/login',
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => LoginViewModel(
              userModel: userModel,
              context: context,
            ),
            child: const LoginView(),
          ),
        ),

        // 메인
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              BottomNavbar(navigationShell: navigationShell),
          branches: [
            // 홈
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => HomeViewModel(
                      userModel: userModel,
                      context: context,
                    ),
                    child: const HomeView(),
                  ),
                )
              ],
            ),

            // 홈
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home2',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => HomeViewModel(
                      userModel: userModel,
                      context: context,
                    ),
                    child: const HomeView(),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
