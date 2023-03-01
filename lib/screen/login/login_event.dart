part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginStart extends LoginEvent {

  final String phoneNumber;

  LoginStart(this.phoneNumber);

}
