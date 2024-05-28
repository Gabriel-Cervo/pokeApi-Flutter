abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(String errorMessage, this.statusCode)
      : super(
          errorMessage,
        );
}
