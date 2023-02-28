import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/models/user_data_model.dart';
import 'package:ecitizen/models/user_education_model.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getCubit(context) => BlocProvider.of(context);
  UserDataModel? userDataModel;
  UserEducationModel? userEducationModel;
  Future<UserDataModel?> getUserDataModel({
    required String documentID,
  }) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(documentID)
        .get();
    if (snapshot.exists) {
      return UserDataModel.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  Future<UserEducationModel?> getUserEducationModel({
    required String documentID,
  }) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('education')
        .doc(documentID)
        .get();
    if (snapshot.exists) {
      return UserEducationModel.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }
}
