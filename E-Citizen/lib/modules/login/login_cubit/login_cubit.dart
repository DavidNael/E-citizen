import 'package:ecitizen/models/user_education_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import '../../../shared/cubit/app_cubit.dart';
import '../../../shared/cubit/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit getCubit(context) => BlocProvider.of(context);

  String? validateNID(String nid) {
    if (nid.isEmpty) {
      emit(LoginNIDInValidState());
      return "National ID can't be empty!";
    } else if (nid.length != 14) {
      emit(LoginNIDInValidState());
      return "National ID must be 14 digits long";
    } else {
      emit(LoginNIDValidState());
      return null;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      emit(LoginPasswordInValidState());
      return "Password can't be empty!";
    } else if (!passwordValidator(password.toString())) {
      emit(LoginPasswordInValidState());
      return "Weak Password. password must contain numerical digit and at least 8 characters long.";
    } else {
      emit(LoginPasswordValidState());
      return null;
    }
  }

  String authenticate({
    required String nid,
    required String password,
  }) {
    // send data to firebase
    return "";
  }

  bool passwordValidator(String value) {
    RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (regExp.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> login({
    // ignore: non_constant_identifier_names
    required String NID,
    required String password,
    required context,
  }) async {
    try {
      // Try To Login To Firebase

      emit(LoginInitialState());

      AppCubit appCubit = AppCubit.getCubit(context);

      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "$NID@egypt.com",
        password: password,
      );

      // If Login Success Emit Success State
      appCubit.userDataModel =
          await appCubit.getUserDataModel(documentID: userCredential.user!.uid);

      appCubit.userEducationModel = await appCubit.getUserEducationModel(
          documentID: userCredential.user!.uid);

      final logger = Logger();
      logger.w(appCubit.userDataModel?.firstName ?? "Nulllll");
      logger.w(appCubit.userEducationModel?.userIsEducated ?? "Nulllll");
      
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        // Login With Unknown Email/Password
        emit(LoginErrorState(UserNotFoundAuthException()));
      } else if (e.code == 'wrong-password') {

        // Login With Known Email But Wrong Password
        emit(LoginErrorState(WrongPasswordAuthException()));
      } else {
        
        // Unknown Firebase Error
        print(e.code);
        emit(LoginErrorState(UnknownAuthException()));
      }
    } catch (other) {
      //Unknown Error
      print(other);
      emit(LoginErrorState(UnknownAuthException()));
    }
  }
}
