part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class LoginSuccessState extends AuthenticationState {}

class UserNotFountState extends AuthenticationState {}

class WronPasswordState extends AuthenticationState {}

class UnknowErrorState extends AuthenticationState {}

class SignUpSuccessState extends AuthenticationState {}

class WeakPasswordState extends AuthenticationState {}

class EmailAlreadyTakenState extends AuthenticationState {}

class SignUpLoadingState extends AuthenticationState {}

class LoginLoadingState extends AuthenticationState {}
