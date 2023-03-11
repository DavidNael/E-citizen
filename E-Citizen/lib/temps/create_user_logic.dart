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
      userSecondarySchoolLevelField: 3,
      userSecondarySchoolNameField: 'مدرسة الحياة الثانوية بنين',
      userSecondarySchoolGraduatedField: true,
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


List<String> usersNIDs = [
  "00000000000000",
  "11111111111111",
  "22222222222222",
  "33333333333333",
  "44444444444444",
  "55555555555555",
];

List<String> usersIDs = [
  "Tw9WakIsm5RobCMpawBXQUK8ikc2",
  "CliQ8We6z6YOqwX9F1YfmObVLyw2",
  "FC5tC7fvGgaOFe75CWXRXGRqS4q2",
  "w4WpwQ4lCAehSlr1ZxDLMmZ7CL43",
  "inQ3TyN0RJVHAQ4NSeDwsid91q63",
  "xB0aLWAgwcYV37J6bOCHmzcIanZ2",
];

void myCreate({
  required int i,
  required List<String> children,
}) {
  createUserData(
    uid: usersIDs[i],
    birthDate: "10-10-2002",
    birthPlace: "Tanta",
    martialStatus: martial,
    fatherName: "FATHER",
    motherName: "MOTHER",
    firstName: 'FULL NAME',
    gender: true,
    nationalID: usersNIDs[i],
    jobs: jobs,
    phoneNumbers: phones,
    addresses: addresses,
    children: children,
  );
}

myCreateEdu({
  required int i,
}) {
  createUserEducation(
    nationalID: usersNIDs[i],
    userIsEducated: true,
    userSchool: education[userSchoolField],
    userBachelor: education[userBachelorField],
    userPHD: education[userPHDField],
    userMaster: education[userMasterField],
  );
}
