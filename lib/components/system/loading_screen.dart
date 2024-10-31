import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ModalBarrier(dismissible: false),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
