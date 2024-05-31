import 'package:flutter/material.dart';
import 'package:pokeapi/src/shared/presentation/widget/app_bar.widget.dart';

class BaseScreen extends StatelessWidget {
  final String? title;
  final bool showBarDivider;
  final Widget child;
  final bool ignoreSafeArea;

  const BaseScreen({
    Key? key,
    this.title,
    this.showBarDivider = true,
    this.ignoreSafeArea = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBarWidget(
          title: title,
          showDivider: showBarDivider,
        ),
        body: SafeArea(
          bottom: false,
          top: !ignoreSafeArea,
          left: !ignoreSafeArea,
          right: !ignoreSafeArea,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: child),
            ],
          ),
        ));
  }
}
