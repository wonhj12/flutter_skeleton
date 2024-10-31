import 'package:flutter/material.dart';
import 'package:flutter_skeleton/components/system/custom_appbar.dart';
import 'package:flutter_skeleton/components/system/custom_scaffold.dart';
import 'package:flutter_skeleton/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    return const CustomScaffold(
      appBar: CustomAppBar(backButton: false),
    );
  }
}
