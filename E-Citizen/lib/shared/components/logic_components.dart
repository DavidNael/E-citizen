// Password Validator
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';

bool passwordValidator(String value) {
  RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (regExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }

}
  Future<UserModel?> getUserData(String doc_id) async {
    final snapshot =
        await FirebaseFirestore.instance.collection("users").doc(doc_id).get();

    if (snapshot.exists) {
      return UserModel.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }
