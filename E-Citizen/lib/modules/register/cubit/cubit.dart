import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/user_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/exceptions.dart';
import 'states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<ECitizenRegisterStates> {
  RegisterCubit() : super(RegisterOInitialState());

  static RegisterCubit getCubit(context) => BlocProvider.of(context);

  String? validateNID(String nid) {
    if (nid.isEmpty) {
      emit(RegisterNIDInValidState());
      return "National ID can't be empty!";
    } else if (nid.length != 14) {
      emit(RegisterNIDInValidState());
      return "National ID must be 14 digits long";
    } else {
      emit(RegisterNIDValidState());
      return null;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      emit(RegisterPasswordInValidState());
      return "Password can't be empty!";
    } else if (!passwordValidator(password.toString())) {
      emit(RegisterPasswordInValidState());
      return "Weak Password. password must contain numerical digit and at least 8 characters long.";
    } else {
      emit(RegisterPasswordValidState());
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
