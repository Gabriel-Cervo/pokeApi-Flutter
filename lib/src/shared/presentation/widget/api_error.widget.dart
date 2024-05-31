import 'package:flutter/material.dart';

class APIErrorWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  const APIErrorWidget({Key? key, required this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      child: Center(
        child: _renderContent(context),
      ),
    );
  }

  Column _renderContent(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.displayLarge),
        _renderDescriptionIfNeeded(context)
      ],
    );
  }

  Widget _renderDescriptionIfNeeded(BuildContext context) {
    if (subtitle == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle!,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
