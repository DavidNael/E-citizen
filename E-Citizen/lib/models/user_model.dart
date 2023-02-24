import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/components/constants.dart';

class UserModel {
  String? documentID;
  final String userID;
  final String authority;
  final String birthDate;
  final String birthPlace;

  final Map<dynamic, dynamic> educationLevel;

  final Map<dynamic, dynamic> martialStatus;

  final String fatherName;
  final String motherName;
  final String firstName;
  final String lastName;

  final bool gender;
  final String nationalID;

  final List<dynamic> jobs;
  final List<dynamic> phoneNumbers;
  final List<dynamic> addresses;
  final List<dynamic> children;

  //! Constructor
  UserModel({
    required this.userID,
    required this.authority,
    required this.birthDate,
    required this.birthPlace,
    required this.educationLevel,
    required this.martialStatus,
    required this.fatherName,
    required this.motherName,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.nationalID,
    required this.jobs,
    required this.phoneNumbers,
    required this.addresses,
    required this.children,
  });

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : userID = snapshot.data()?[userIDField] as String,
        documentID = snapshot.id,
        gender = snapshot.data()?[userGenderField] as bool,
        nationalID = snapshot.data()?[userNationalIDField] as String,
        phoneNumbers = snapshot.data()?[userPhoneNumbersField] as List<dynamic>,
        jobs = snapshot.data()?[userJobsField] as List<dynamic>,
        addresses = snapshot.data()?[userAddressesField] as List<dynamic>,
        authority = snapshot.data()?[userAuthorityField] as String,
        birthDate = snapshot.data()?[userBirthDateField] as String,
        birthPlace = snapshot.data()?[userBirthPlaceField] as String,
        educationLevel =
            snapshot.data()?[userEducationLevelField] as Map<dynamic, dynamic>,
        martialStatus =
            snapshot.data()?[userMartialStatusField] as Map<dynamic, dynamic>,
        fatherName = snapshot.data()?[userFatherNameField] as String,
        motherName = snapshot.data()?[userMotherNameField] as String,
        firstName = snapshot.data()?[userFirstNameField] as String,
        lastName = snapshot.data()?[userLastNameField] as String,
        children = snapshot.data()?[userChildren] as List<dynamic>;

  Map<String, dynamic> toMap() {
    return {
      userIDField: userID,
      userAuthorityField: authority,
      userBirthDateField: birthDate,
      userBirthPlaceField: birthPlace,
      userEducationLevelField: educationLevel,
      userMartialStatusField: martialStatus,
      userFatherNameField: fatherName,
      userMotherNameField: motherName,
      userFirstNameField: firstName,
      userLastNameField: lastName,
      userGenderField: gender,
      userNationalIDField: nationalID,
      userJobsField: jobs,
      userPhoneNumbersField: phoneNumbers,
      userAddressesField: addresses,
      userChildren: children,
    };
  }
}
