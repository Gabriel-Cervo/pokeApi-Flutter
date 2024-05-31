import 'package:flutter/material.dart';
import 'package:pokeapi/src/shared/presentation/widget/app_bar.widget.dart';

class BaseScreen extends StatelessWidget {
  final String? title;
  final Widget child;

  const BaseScreen({
    Key? key,
    this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBarWidget(title: title),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: child),
            ],
          ),
        ));
  }
}
