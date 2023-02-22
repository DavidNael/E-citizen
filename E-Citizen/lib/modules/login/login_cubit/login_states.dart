abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginNIDValidState extends LoginStates {}

class LoginNIDInValidState extends LoginStates {}

class LoginPasswordInValidState extends LoginStates {}

class LoginPasswordValidState extends LoginStates {}

class LoggingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final Exception exception;

  LoginErrorState(this.exception);
}
