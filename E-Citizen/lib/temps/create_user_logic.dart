import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/models/user_education_model.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data_model.dart';

void createUserData({
  required String uid,
  required String birthDate,
  required String birthPlace,
  required Map<dynamic, dynamic> martialStatus,
  required String fatherName,
  required String motherName,
  required String firstName,
  required bool gender,
  required String nationalID,
  required List<dynamic> jobs,
  required List<dynamic> phoneNumbers,
  required List<dynamic> addresses,
  required List<dynamic> children,
  double balance = -5,
}) async {
  UserDataModel user = UserDataModel(
    balance: balance,
    birthDate: birthDate,
    birthPlace: birthPlace,
    martialStatus: martialStatus,
    fatherName: fatherName,
    motherName: motherName,
    fullName: firstName,
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
      .doc(nationalID)
      .set(user.toMap());
}

void createUserEducation({
  required String nationalID,
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
      .collection('users')
      .doc(nationalID)
      .collection('education')
      .doc(nationalID)
      .set(userEducationModel.toMap());
}

Map<dynamic, dynamic> education = {
  userIsEducatedField: true,
  userSchoolField: {
    userPrimarySchoolField: {
      userPrimarySchoolLevelField: 6,
      userPrimarySchoolNameField: 'مدرسة الحياة الابتدائية',
      userPrimarySchoolGraduatedField: true,
    },
    userPreparatorySchoolField: {
      userPreparatorySchoolLevelField: 3,
      userPreparatorySchoolNameField: 'مدرسة الحياة الاعدادية',
      userPreparatorySchoolGraduatedField: true,
    },
    userSecondarySchoolField: {
      userPrimarySchoolLevelField: 6,
      userPrimarySchoolNameField: 'مدرسة الحياة الثانوية بنين',
      userPrimarySchoolGraduatedField: true,
    },
  },
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
};

Map<dynamic, dynamic> martial = {
  userSingleField: true,
  userMarriedField: false,
  userDivorcedField: false,
};

List<dynamic> addresses = ['address', "Address 2"];
List<dynamic> phones = ['0114522002', "01232131041"];
List<dynamic> jobs = ['كلام في الحب', 'Food Reviwer', 'Slave at FCAI'];

//3 create account
void createAccount({
  required String nid,
  String password = 'Abc12345',
}) {
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: '$nid@egypt.com',
    password: password,
  );
}

Map<dynamic, dynamic> educationNoData = {
  userIsEducatedField: false,
  userBachelorField: {
    userBachelorLevelField: 0,
    userBachelorUniversityField: "",
    userHaveBachelorField: false,
  },
  userMasterField: {
    userHaveMasterField: false,
    userMasterNameField: "",
    userMasterUniversityField: "",
  },
  userPHDField: {
    userHavePHDField: false,
    userPHDNameField: "",
    userPHDUniversityField: "",
  },
  userSchoolField: {
    userPrimarySchoolField: {
      userPrimarySchoolLevelField: 0,
      userPrimarySchoolNameField: '',
      userPrimarySchoolGraduatedField: false,
    },
    userPreparatorySchoolField: {
      userPreparatorySchoolLevelField: 0,
      userPreparatorySchoolNameField: '',
      userPreparatorySchoolGraduatedField: false,
    },
    userSecondarySchoolField: {
      userPrimarySchoolLevelField: 0,
      userPrimarySchoolNameField: '',
      userPrimarySchoolGraduatedField: false,
    },
  }
};

// void tme() {
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(userID)
//       .collection(newName)
//       .doc(userID)
//       .set(modelName.toMap());
// }
