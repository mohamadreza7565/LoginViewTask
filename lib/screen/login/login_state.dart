part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{

  final Login login;

  LoginSuccess(this.login);

}

class LoginError extends LoginState{

  final ErrorModel error;

  LoginError(this.error);

}
