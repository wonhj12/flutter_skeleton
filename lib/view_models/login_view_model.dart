import 'package:flutter/material.dart';
import 'package:flutter_skeleton/models/user_model.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel with ChangeNotifier {
  UserModel userModel;
  BuildContext context;

  LoginViewModel({required this.userModel, required this.context});

  /// 로그인
  void login() {
    userModel.setName('name');
    context.go('/home');
  }
}
