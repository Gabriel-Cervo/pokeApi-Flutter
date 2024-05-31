import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;

  const LoadingIndicator({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 100,
      width: size ?? 100,
      child: const CircularProgressIndicator(),
    );
  }
}
