import 'package:flutter/material.dart';
import 'package:flutter_skeleton/components/system/loading_screen.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final bool isLoading;
  final Widget? body;

  /// ### Padding, safe area, loading 등 공통 설정 값이 적용된 Scaffold
  /// 좌우 padding: 16px
  const CustomScaffold({
    super.key,
    this.appBar,
    this.resizeToAvoidBottomInset,
    this.isLoading = false,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: SafeArea(
          child: Stack(
            children: [
              // body
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: body,
              ),

              // 로딩
              if (isLoading) const Center(child: LoadingScreen())
            ],
          ),
        ),
      ),
    );
  }
}
