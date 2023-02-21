abstract class ECitizenLoginStates {}

class LoginOInitialState extends ECitizenLoginStates {}

class InitialState extends ECitizenLoginStates {}

class LoginNIDValidState extends ECitizenLoginStates {}

class LoginNIDInValidState extends ECitizenLoginStates {}

class LoginPasswordInValidState extends ECitizenLoginStates {}

class LoginPasswordValidState extends ECitizenLoginStates {}

class LoginSuccessState extends ECitizenLoginStates {}

class LoginErrorState extends ECitizenLoginStates {
  final Exception exception;

  LoginErrorState(this.exception);
}
