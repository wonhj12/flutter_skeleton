import 'package:flutter/material.dart';
import 'package:flutter_skeleton/components/main_button.dart';
import 'package:flutter_skeleton/components/system/custom_appbar.dart';
import 'package:flutter_skeleton/components/system/custom_scaffold.dart';
import 'package:flutter_skeleton/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = context.watch<LoginViewModel>();

    return CustomScaffold(
      appBar: const CustomAppBar(backButton: false),
      body: MainButton(text: '로그인', onPressed: loginViewModel.login),
    );
  }
}
