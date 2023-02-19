import 'package:ecitizen/shared/styles/color.dart';
import 'package:flutter/material.dart';

// Custom TextFormField
Widget myTextFormField({
  required TextEditingController textController,
  required TextInputType keyboardType,
  bool isPassword = false,
  required Icon prefixIcon,
  IconButton? suffixIcon,
  required String label,
  required Function(String?) validator,
  Function(String value)? myOnFieldSubmitted,
  Function(String value)? myOnChanged,
  double borderRadius = 25.0,
}) {
  return TextFormField(
    controller: textController,
    keyboardType: keyboardType,
    obscureText: isPassword,
    validator: (String? value) => validator(value),
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      labelText: label,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    onFieldSubmitted: myOnFieldSubmitted,
    onChanged: myOnChanged,
  );
}

//Custom Elevated Button
Widget myElevatedButton({
  required String text,
  Color buttonColor = myYellow,
  Color textColor = Colors.white,
}) {
  return ElevatedButton(
    onPressed: () {},
    style: TextButton.styleFrom(backgroundColor: buttonColor),
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}

// Custom button
Widget myButton({
  double width = double.infinity,
  Color textColor = Colors.black,
  Color backgroundColor = Colors.grey,
  bool isUpperCase = false,
  double radius = 25.0,
  double textSize = 20.0,
  required Function() onPressed,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );

// Search bar
Widget searchBar() => Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: TextFormField(
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
            filled: true,
            focusColor: Colors.blue,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                width: 3.0,
                color: Colors.blue,
              ),
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                size: 20,
                color: Colors.grey[600],
              ),
              onPressed: () {},
            ),
            hintText: "Search",
          ),
          onFieldSubmitted: (value) {},
        ),
      ),
    );

Widget verticalSeparator({double value = 10}) => SizedBox(height: value);

Widget horizontalSeparator({double value = 10}) => SizedBox(width: value);

// Custom icon
Widget myIcon(
        {Color iconColor = Colors.white,
        Color? backgroundColor,
        required Icon icon,
        Function()? onPressed}) =>
    CircleAvatar(
      backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.6),
      child: IconButton(
        disabledColor: iconColor,
        icon: icon,
        onPressed: onPressed,
      ),
    );

// Build model
/*Widget buildUserModel(UserModel user) => Row(
  children: [
    CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue,
      child: Text(
        "${user.id}",
        style: const TextStyle(color: Colors.white),
      ),
    ),
    const SizedBox(
      width: 10,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${user.name}",
        ),
        Text(
          "${user.phoneNumber}",
        )
      ],
    ),
  ],
);*/

// Navigation button
Widget navButton({
  required context,
  required Widget destination,
  required String name,
}) =>
    TextButton(
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          );
        });

Widget navigateTo({
  required BuildContext context,
  required Widget destination,
}) =>
    IconButton(
        icon: const Icon(
          Icons.amp_stories_rounded,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          );
        });

BoxDecoration decorateContainer() => BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(25),
    );
//! Password Validator
bool validatePassword(String value) {
  RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (regExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}
