import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:ecitizen/shared/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../components/exceptions.dart';

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

  String authinticate({
    required String nid,
    required String password,
  }) {
    // send data to firebase
    return "";
  }

  Future<void> login(String NID, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: NID, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw UnknownAuthException();
      }
    } catch (_) {}
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
