import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/models/user_education_model.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data_model.dart';

// final docID = FirebaseAuth.instance.currentUser!.uid;

void createUserData({
  required String uid,
  required String authority,
  required String birthDate,
  required String birthPlace,
  required Map<dynamic, dynamic> educationLevel,
  required Map<dynamic, dynamic> martialStatus,
  required String fatherName,
  required String motherName,
  required String firstName,
  required String lastName,
  required bool gender,
  required String nationalID,
  required List<dynamic> jobs,
  required List<dynamic> phoneNumbers,
  required List<dynamic> addresses,
  required List<dynamic> children,
}) async {
  UserDataModel user = UserDataModel(
    userBalance: 5.3,
    birthDate: birthDate,
    birthPlace: birthPlace,
    martialStatus: martialStatus,
    fatherName: fatherName,
    motherName: motherName,
    firstName: firstName,
    lastName: lastName,
    gender: gender,
    nationalID: nationalID,
    jobs: jobs,
    phoneNumbers: phoneNumbers,
    addresses: addresses,
    children: children,
    userID: uid,
  );

  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .set(user.toMap());
}

void createUserEducation({
  required String uid,
  required bool userIsEducated,
  required Map<dynamic, dynamic> userSchool,
  required Map<dynamic, dynamic> userBachelor,
  required Map<dynamic, dynamic> userPHD,
  required Map<dynamic, dynamic> userMaster,
}) async {
  UserEducationModel userEducationModel = UserEducationModel(
    userIsEducated: userIsEducated,
    userSchool: userSchool,
    userBachelor: userBachelor,
    userPHD: userPHD,
    userMaster: userMaster,
  );

  await FirebaseFirestore.instance
      .collection('education')
      .doc(uid)
      .set(userEducationModel.toMap());
}

Map<dynamic, dynamic> education = {
  userIsEducatedField: true,
  userBachelorField: {
    userBachelorLevelField: 0,
    userBachelorUniversityField: "Cairo",
    userHaveBachelorField: true,
  },
  userMasterField: {
    userHaveMasterField: true,
    userMasterNameField: "Bio Informatics",
    userMasterUniversityField: "Cairo",
  },
  userPHDField: {
    userHavePHDField: true,
    userPHDNameField: "Bio Infomatics",
    userPHDUniversityField: "Cairo",
  },
  userSchoolField: {
    userPrimarySchoolField: {
      userPrimarySchoolLevelField: 6,
      userPrimarySchoolNameField: 'مدرسة الحياة الابتدائية',
      userPrimarySchoolGraduatedField: true,
    },
    userPreparatorySchooField: {
      userPreparatorySchoolLevelField: 3,
      userPreparatorySchoolNameField: 'مدرسة الحياة الاعدادية',
      userPreparatorySchoolGraduatedField: true,
    },
    userSecondarySchoolField: {
      userPrimarySchoolLevelField: 6,
      userPrimarySchoolNameField: 'مدرسة الحياة الثانوية بنين',
      userPrimarySchoolGraduatedField: true,
    },
  }
};

Map<dynamic, dynamic> martial = {
  userSingleField: true,
  userMarriedField: false,
  userDivorcedField: false,
};

List<dynamic> addresses = ['address', "Address 2"];
List<dynamic> phones = ['0114522002', "01232131041"];
List<dynamic> jobs = ['كلام في الحب', 'Food Reviwer', 'Slave at FCAI'];
