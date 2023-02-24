// Password Validator
bool passwordValidator(String value) {
  RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (regExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}
