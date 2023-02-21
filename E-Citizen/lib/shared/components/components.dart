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
  VoidCallback? myOnTap,
  double borderRadius = 25.0,
  double width = double.infinity,
  double padding = 10,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    // height: height,
    width: width,
    child: TextFormField(
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

// todo test this function
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

// Navigate And Replace
void navigateAndReplace({
  required BuildContext context,
  required Widget destination,
}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return destination;
      },
    ),
  );
}

Widget buildService2({
  required String serviceName,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      child: ListTile(
        onTap: onTap,
        title: Text(
          serviceName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        tileColor: myBlueColor,
      ),
    ),
  );
}
