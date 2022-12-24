abstract class Failure {

}


class ServerFailure extends Failure{
  String message;

  ServerFailure({required this.message});
}