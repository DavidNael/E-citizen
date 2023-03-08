import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/shared/components/constants.dart';

class UserEducationModel {
  bool userIsEducated = false;
  Map<dynamic, dynamic> userSchool = {};
  Map<dynamic, dynamic> userBachelor = {};
  Map<dynamic, dynamic> userPHD = {};
  Map<dynamic, dynamic> userMaster = {};

  UserEducationModel({
    required this.userIsEducated,
    required this.userSchool,
    required this.userBachelor,
    required this.userPHD,
    required this.userMaster,
  });

  /// Get Data From Firebase
  // Class name.any name = named constructor
  // Named Constructor
  UserEducationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    userIsEducated = documentSnapshot.data()?[userIsEducatedField] as bool;
    userSchool =
        documentSnapshot.data()?[userSchoolField] as Map<dynamic, dynamic>;
    userBachelor =
        documentSnapshot.data()?[userBachelorField] as Map<dynamic, dynamic>;
    userPHD = documentSnapshot.data()?[userPHDField] as Map<dynamic, dynamic>;
    userMaster =
        documentSnapshot.data()?[userMasterField] as Map<dynamic, dynamic>;
  }

  /// Set Data To Firebase
  Map<String, dynamic> toMap() {
    return {
      userIsEducatedField: userIsEducated,
      userSchoolField: userSchool,
      userBachelorField: userBachelor,
      userPHDField: userPHD,
      userMasterField: userMaster,
    };
  }
}
