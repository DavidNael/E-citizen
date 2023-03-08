import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/models/user_data_model.dart';
import 'package:ecitizen/models/user_education_model.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getCubit(context) => BlocProvider.of(context);
  UserDataModel? userDataModel;
  UserEducationModel? userEducationModel;

  //1 Get Data Of User
  Future<UserDataModel?> getUserDataModel({
    // documentID is the national ID of the user
    required String uid,
  }) async {
    //3 snapshot is all documents where userIDField = uid
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where(userIDField, isEqualTo: uid)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return UserDataModel.fromSnapshot(snapshot.docs.first);
    } else {
      return null;
    }
  }

  //1 Get Educational Data of User
  Future<UserEducationModel?> getUserEducationModel({
    required String nid,
  }) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(nid)
        .collection('education')
        .doc(nid)
        .get();
    if (snapshot.exists) {
      return UserEducationModel.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }

  //1 Get List Of Children Of User
  // Future<List<UserDataModel>> getChildren({
  //   required List<dynamic> childrenIDs,
  // }) async {
  //   final childrenData = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(docID)
  //       .collection(newname)
  //       .doc(docID)
  //       .where(userNationalIDField, whereIn: childrenIDs)
  //       .get();
  //   return childrenData.docs
  //       .map((doc) => UserDataModel.fromSnapshot(doc))
  //       .toList();
  // }
}
