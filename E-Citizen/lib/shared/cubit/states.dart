import 'package:firebase_core/firebase_core.dart';

abstract class ECitizenStates {}

class InitialState extends ECitizenStates {}

class NIDValidState extends ECitizenStates {}

class NIDInValidState extends ECitizenStates {}

class PasswordInValidState extends ECitizenStates {}

class PasswordValidState extends ECitizenStates {}
