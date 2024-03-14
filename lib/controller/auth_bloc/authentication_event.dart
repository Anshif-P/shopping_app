part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class UserLoginEvent extends AuthenticationEvent {
  String email;
  String password;
  UserLoginEvent({required this.email, required this.password});
}

class UserSignUpEvent extends AuthenticationEvent {
  String email;
  String password;
  String userName;
  UserSignUpEvent(
      {required this.email, required this.password, required this.userName});
}
