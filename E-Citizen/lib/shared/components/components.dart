import 'dart:ffi';

import 'package:ecitizen/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  VoidCallback? myOnTap,
  double borderRadius = 25.0,
  double width = double.infinity,
  double padding = 10,
  int characterLimit = 99,
  String? defaultValue,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    width: width,
    child: TextFormField(
      initialValue: defaultValue,
      inputFormatters: [
        LengthLimitingTextInputFormatter(characterLimit),
      ],
      controller: textController,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: (String? value) => validator(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(padding),
        errorMaxLines: 2,
        prefixIcon: prefixIcon,
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onFieldSubmitted: myOnFieldSubmitted,
      onChanged: myOnChanged,
      onTap: myOnTap,
    ),
  );
}

//Custom Elevated Button
Widget myElevatedButton({
  required String text,
  Color buttonColor = myYellow1,
  Color textColor = Colors.white,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: buttonColor,
    ),
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

void navigateTo({required BuildContext context, required Widget destination}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => destination),
  );
}

BoxDecoration decorateContainer() => BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(25),
    );
//! Password Validator
bool passwordValidator(String value) {
  RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (regExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}

//!
Widget buildRow({
  required List<Widget> widgets,
  double space = 10,
}) {
  return Row(
    children: [
      ListView.separated(
        itemBuilder: (context, index) {
          return widgets[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: space,
          );
        },
        itemCount: widgets.length,
      )
    ],
  );
}

//!
Widget buildService1({
  required String serviceName,
}) =>
    Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: myBlueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        serviceName,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

Future<dynamic> myShowDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<dynamic> myLoadingDialog({
  required BuildContext context,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: const [
            Text(
              "Loading...",
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(),
          ],
        ),
        // actions: [],
      );
    },
  );
}

// Navigate And Replace
void navigateAndReplace({
  required BuildContext context,
  required Widget destination,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => destination),
    (Route<dynamic> route) => false,
  );
}

Widget buildService2({
  required String serviceName,
  required String serviceImagePath,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      onTap: onTap,
      title: Text(
        serviceName,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      tileColor: myBlueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

Widget myPositionedCircle({
  double width = 50,
  double height = 50,
  double? topOffset,
  double? bottomOffset,
  double? rightOffset,
  double? leftOffset,
}) {
  return Positioned(
    top: topOffset,
    bottom: bottomOffset,
    left: leftOffset,
    right: rightOffset,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: myBlueColor,
        shape: BoxShape.circle,
      ),
    ),
  );
}

Widget myTitle({
  String title = "User",
  Color boxColor = myBlueColor,
  Color textColor = Colors.white,
  double boxOpacity = 1,
}) {
  return Container(
    // alignment: Alignment.center,
    decoration: BoxDecoration(
      color: boxColor.withOpacity(boxOpacity),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}

Widget iconWidget({
  String title = "",
  IconData icon = Icons.error,
  Color iconOutlineColor = myBlueColor,
  Color iconColor = Colors.white,
  Color textColor = Colors.white,
}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconOutlineColor,
        ),
        child: Icon(icon, color: iconColor),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          title,
          style: TextStyle(color: textColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget settingTileWidget({
  bool isEnabled = true,
  String title = "",
  String subtitle = "",
  double borderRadius = 10.0,
  double tileOpacity = 1,
  double? width,
  double? height,
  IconData icon = Icons.error,
  Color iconOutlineColor = myBlueColor,
  Color iconColor = Colors.white,
  Color tileColor = myBlueColor,
  Color titleColor = Colors.white,
  Color borderColor = backgroundColor,
  VoidCallback? onTap,
  Widget? trailing,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: tileColor.withOpacity(tileOpacity),
        borderRadius: BorderRadius.circular(borderRadius),
        child: ListTile(
          enabled: isEnabled,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          title: iconWidget(
            title: title,
            textColor: titleColor,
            icon: icon,
            iconColor: iconColor,
            iconOutlineColor: iconOutlineColor,
          ),
          subtitle: subtitle != "" ? Text(subtitle) : null,
          onTap: onTap,
          trailing: trailing,
        ),
      ),
    ),
  );
}
