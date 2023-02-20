import 'package:bloc/bloc.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:ecitizen/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ECitizenCubit extends Cubit<ECitizenStates> {
  ECitizenCubit() : super(InitialState());

  static ECitizenCubit getCubit(context) => BlocProvider.of(context);

  String? validateNID(String nid) {
    if (nid.isEmpty) {
      emit(NIDInValidState());
      return "National ID can't be empty!";
    } else if (nid.length != 14) {
      emit(NIDInValidState());
      return "National ID must be 14 digits long";
    } else {
      emit(NIDValidState());
      return null;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      emit(PasswordInValidState());
      return "Password can't be empty!";
    } else if (!passwordValidator(password.toString())) {
      emit(PasswordInValidState());
      return "Weak Password. password must contain numerical digit and at least 8 characters long.";
    } else {
      emit(PasswordValidState());
      return null;
    }
  }
}
