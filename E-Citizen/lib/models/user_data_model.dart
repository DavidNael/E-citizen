import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/components/constants.dart';

class UserDataModel {
  String? userDataDocID = '';
  String userID = '';
  String birthDate = '';
  String birthPlace = '';
  double balance = 0.0;
  Map<dynamic, dynamic> martialStatus = {};

  String fatherName = '';
  String motherName = '';
  String fullName = '';

  bool gender = false;
  String nationalID = '';

  List<dynamic> jobs = [];
  List<dynamic> phoneNumbers = [];
  List<dynamic> addresses = [];
  List<dynamic> children = [];

  //! Constructor
  UserDataModel({
    required this.balance,
    required this.userID,
    required this.birthDate,
    required this.birthPlace,
    required this.martialStatus,
    required this.fatherName,
    required this.motherName,
    required this.fullName,
    required this.gender,
    required this.nationalID,
    required this.jobs,
    required this.phoneNumbers,
    required this.addresses,
    required this.children,
  });

  UserDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    nationalID = documentSnapshot.data()?[userNationalIDField] as String;
    userID = documentSnapshot.data()?[userIDField] as String;
    balance = documentSnapshot.data()?[userBalanceField].toDouble();
    userDataDocID = documentSnapshot.id;
    gender = documentSnapshot.data()?[userGenderField] as bool;
    phoneNumbers =
        documentSnapshot.data()?[userPhoneNumbersField] as List<dynamic>;
    jobs = documentSnapshot.data()?[userJobsField] as List<dynamic>;
    addresses = documentSnapshot.data()?[userAddressesField] as List<dynamic>;
    birthDate = documentSnapshot.data()?[userBirthDateField] as String;
    birthPlace = documentSnapshot.data()?[userBirthPlaceField] as String;

    martialStatus = documentSnapshot.data()?[userMartialStatusField]
        as Map<dynamic, dynamic>;
    fatherName = documentSnapshot.data()?[userFatherNameField] as String;
    motherName = documentSnapshot.data()?[userMotherNameField] as String;
    fullName = documentSnapshot.data()?[userFullNameField] as String;
    children = documentSnapshot.data()?[userChildren] as List<dynamic>;
  }

  //
  Map<String, dynamic> toMap() {
    return {
      userNationalIDField: nationalID,
      userIDField: userID,
      userBalanceField: balance,
      userBirthDateField: birthDate,
      userBirthPlaceField: birthPlace,
      userMartialStatusField: martialStatus,
      userFatherNameField: fatherName,
      userMotherNameField: motherName,
      userFullNameField: fullName,
      userGenderField: gender,
      userJobsField: jobs,
      userPhoneNumbersField: phoneNumbers,
      userAddressesField: addresses,
      userChildren: children,
    };
  }
}
