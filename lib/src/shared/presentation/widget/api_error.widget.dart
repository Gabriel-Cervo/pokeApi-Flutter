import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';

class APIErrorWidget extends StatelessWidget {
  final Failure failure;
  final Function()? didTapRetry;

  const APIErrorWidget({Key? key, required this.failure, this.didTapRetry})
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
        Text('Ops... algo deu errado',
            style: Theme.of(context).textTheme.displayLarge),
        _renderDescription(context),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: didTapRetry != null ? () => didTapRetry!() : null,
            child: const Text('Tentar novamente'))
      ],
    );
  }

  Widget _renderDescription(BuildContext context) {
    String subtitle = 'Por favor, verifique sua conexão e tente novamente';

    if (failure is ServerFailure) {
      final serverFailure = failure as ServerFailure;

      if (serverFailure.statusCode != null) {
        subtitle =
            "${serverFailure.errorMessage}\nCódigo de erro: ${serverFailure.statusCode}";
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
