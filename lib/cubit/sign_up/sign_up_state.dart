abstract class AuthState {} // * main state

class AuthInitialState extends AuthState {}

class AuthErrorState extends AuthState {}

class AuthSuccessState extends AuthState {}
