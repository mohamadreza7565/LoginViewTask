
import '../data/model/error.dart';

abstract class Result<T> {}

class Success<T> extends Result<T> {

  final T data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  final ErrorModel error;

  Error(this.error);
}