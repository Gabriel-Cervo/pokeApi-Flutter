import 'package:flutter/material.dart';
import 'package:pokeapi/src/shared/presentation/widget/app_bar.widget.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final String title;

  const BaseScreen({
    Key? key,
    required this.child,
    required this.title,
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
