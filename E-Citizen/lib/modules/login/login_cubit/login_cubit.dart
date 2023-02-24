import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../layout/home_layout_screen.dart';
import '../../../models/user_model.dart';
import '../../../shared/components/logic_components.dart';
import '../../../shared/components/ui_components.dart';
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

  Future<void> login(String NID, String password) async {
    try {
      emit(LoginInitialState());
      //Try To Login To Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "$NID@egypt.com",
        password: password,
      );
      // If Login Success Emit Success State
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      //Login With Unknown Email/Password
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(UserNotFoundAuthException()));
      }
      //Login With Known Email But Wrong Password
      else if (e.code == 'wrong-password') {
        emit(LoginErrorState(WrongPasswordAuthException()));
      }
      //Unknown Firebase Error
      else {
        emit(LoginErrorState(UnknownAuthException()));
      }
    } catch (_) {
      //Unknown Error
      emit(LoginErrorState(UnknownAuthException()));
    }
  }

  final users = FirebaseFirestore.instance.collection('users');

  //! Return List Of Documents
  Stream<Iterable<UserModel>>? allUsers({required String ownerUserId}) {
    return users
        .snapshots()
        .map((event) => event.docs.map((doc) => UserModel.fromSnapshot(doc)));
  }

//   Future<UserModel> register({required String nid,required String phone,required String password}){
// try{
//   await users.doc(FirebaseAuth.instance.currentUser).set({

//   });
// }
//   }
}
