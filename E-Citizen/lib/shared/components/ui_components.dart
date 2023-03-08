import 'dart:ui';
import 'package:ecitizen/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Custom TextFormField
Widget myTextFormField({
  required TextEditingController textController,
  required TextInputType keyboardType,
  bool isPassword = false,
  Icon? prefixIcon,
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

// Custom Elevated Button
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
}) {
  return Container(
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
}

// Search bar
Widget searchBar() {
  return Padding(
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
}

Widget verticalSeparator({double value = 10}) => SizedBox(height: value);

Widget horizontalSeparator({double value = 10}) => SizedBox(width: value);

// Custom icon
Widget myIcon(
    {Color iconColor = Colors.white,
    Color? backgroundColor,
    required Icon icon,
    Function()? onPressed}) {
  return CircleAvatar(
    backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.6),
    child: IconButton(
      disabledColor: iconColor,
      icon: icon,
      onPressed: onPressed,
    ),
  );
}

// Control containers
BoxDecoration decorateContainer() {
  return BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(25),
  );
}

// Build Row
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

// Build Service 1
Widget buildService1({
  required String serviceName,
}) {
  return Container(
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
}

// Alert Dialog
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

// Alert Dialog 2
Future<dynamic> myShowDialog2({
  required BuildContext context,
  required String title,
  required Widget content,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        content: SizedBox(
          height: 200,
          width: 200,
          child: content,
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

// Popup TextFormField
Future<dynamic> myFormDialog({
  required BuildContext context,
  required String title,
  required String successTitle,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      final formKey = GlobalKey<FormState>();
      final nidController = TextEditingController();
      return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // backgroundColor: isDarkMode ? darkBorderTheme : lightBorderTheme,
        title: Text(
          title,
          style: const TextStyle(
              // color: isDarkMode ? darkTextTheme : lightTextTheme,
              ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: myTextFormField(
                borderRadius: 15,
                textController: nidController,
                keyboardType: TextInputType.number,
                label: 'Partner National ID',
                validator: (partnerNID) {
                  if (partnerNID.toString().isEmpty) {
                    return "National ID can't be empty!";
                  } else if (partnerNID.toString().length != 14) {
                    return "National ID must be 14 digits long";
                  }
                  return null;
                },
                characterLimit: 14,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //!Cancel Button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        // color: isDarkMode ? darkTextTheme : lightTextTheme,
                        ),
                  ),
                ),
                //!OK Button
                TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      myShowDialog(
                        context: context,
                        title: '$successTitle Request',
                        content:
                            '$successTitle request has seen successfully sent.',
                      );
                    }
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        // color: isDarkMode ? darkTextTheme : lightTextTheme,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}

// Loading Dialog
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

//2 put icon
// Build Service 2
Widget buildService2({
  required String serviceName,
  required String serviceImagePath,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        color: myBlueColor.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          onTap: onTap,
          title: Center(
            child: Text(
              serviceName,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
  );
}

// Login Screen Background (Circles)
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
      decoration: const BoxDecoration(
        color: myBlueColor,
        shape: BoxShape.circle,
      ),
    ),
  );
}

// Info Section In Home Screen
Widget myTitle({
  bool isBold = false,
  bool isUnderline = false,
  String title = "",
  Color boxColor = Colors.transparent,
  Color textColor = Colors.black,
  int maxLines = 1,
  double borderRadius = 0,
  double boxOpacity = 0,
  double fontSize = 20,
  TextAlign textAlign = TextAlign.start,
  IconData? icon,
  BoxBorder? boxBorder,
}) {
  return Container(
    // alignment: Alignment.center,
    decoration: BoxDecoration(
      color: boxColor.withOpacity(boxOpacity),
      borderRadius: BorderRadius.circular(10),
      border: boxBorder,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : null,
          decoration: isUnderline ? TextDecoration.underline : null,
        ),
        maxLines: maxLines,
        textAlign: textAlign,
      ),
    ),
  );
}

// Logic Tile - Icon
Widget iconWidget({
  String title = "",
  IconData icon = Icons.error,
  int maxTitleLines = 1,
  bool disableIcon = false,
  Color iconOutlineColor = myBlueColor,
  Color iconColor = Colors.white,
  Color textColor = Colors.white,
}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration: disableIcon
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                color: iconOutlineColor,
              ),
        child: disableIcon ? null : Icon(icon, color: iconColor),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          title,
          style: TextStyle(color: textColor),
          overflow: TextOverflow.ellipsis,
          maxLines: maxTitleLines,
        ),
      ),
    ],
  );
}

// Logic Tile - Container
Widget settingTileWidget({
  bool isEnabled = true,
  bool disableIcon = false,
  String title = "",
  String subtitle = "",
  double borderRadius = 10.0,
  double tileOpacity = 1,
  double? width,
  double? height,
  int maxTitleLines = 1,
  IconData icon = Icons.error,
  Color iconOutlineColor = myBlueColor,
  Color iconColor = Colors.white,
  Color tileColor = myBlueColor,
  Color titleColor = Colors.white,
  Color borderColor = backgroundColor,
  VoidCallback? onTap,
  Widget? trailing,
  bool withIcon = true,
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
          title: withIcon
              ? iconWidget(
                  title: title,
                  textColor: titleColor,
                  icon: icon,
                  iconColor: iconColor,
                  iconOutlineColor: iconOutlineColor,
                  maxTitleLines: maxTitleLines,
                  disableIcon: disableIcon,
                )
              : Text(
                  title,
                  style: TextStyle(color: textColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxTitleLines,
                ),
          subtitle: subtitle != "" ? Text(subtitle) : null,
          onTap: onTap,
          trailing: trailing,
        ),
      ),
    ),
  );
}

// Control bluring
Widget blurEffect({required Widget child}) {
  return Stack(
    children: [
      /// Background Image
      // Image.network(
      //   // "https://e7.pngegg.com/pngimages/915/155/png-clipart-flying-eagles-eagle-fly.png",
      //   // "https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1657572126/EducationHub/photos/RLTUT_Key_image.jpg",
      //   // "https://e7.pngegg.com/pngimages/508/257/png-clipart-flag-of-egypt-desktop-google-play-egypt-flag-egypt-thumbnail.png",
      //   // "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/2560px-Flag_of_Egypt.svg.png",
      //   "https://cdn.mos.cms.futurecdn.net/7YrobQvFFzw8aWsAUtoYXB.jpg",

      //   fit: BoxFit.cover,
      //   width: double.infinity,
      //   height: double.infinity,
      // ),

      /// Gradient Container
      // Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       tileMode: TileMode.clamp,
      //       begin: Alignment.centerLeft,
      //       end: Alignment.centerRight,
      //       colors: [
      //         Colors.purple,
      //         Color.fromARGB(255, 255, 17, 1),
      //       ],
      //     ),
      //   ),
      // ),

      // Frosted Glass Effect
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              // borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    ],
  );
}

Widget background({required Widget child}) {
  return SingleChildScrollView(
    child: Stack(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: const Center(
              child: Text(
            "E-Citizen",
            style: TextStyle(
              fontSize: 20,
            ),
          )),
        ),
        Padding(padding: const EdgeInsets.only(top: 50), child: child)
      ],
    ),
  );
}

ExpansionPanel myExpansionPanel({
  required String title,
  required bool isExpanded,
  required Widget body,
}) {
  return ExpansionPanel(
    headerBuilder: (BuildContext context, bool isExpanded) {
      return ListTile(
        title: Text(title),
      );
    },
    body: body,
    isExpanded: isExpanded,
  );
}

Widget myTextField({
  required TextEditingController textController,
  TextInputType keyboardType = TextInputType.name,
  bool isPassword = false,
  bool isEnabled = true,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  required String label,
  Function(String value)? onChanged,
  VoidCallback? onTap,
  double borderRadius = 25.0,
  double width = double.infinity,
  double padding = 10,
  int characterLimit = 99,
  String defaultValue = "",
}) {
  textController.text = defaultValue;
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    width: width,
    child: TextField(
      enabled: isEnabled,
      inputFormatters: [
        LengthLimitingTextInputFormatter(characterLimit),
      ],
      controller: textController,
      keyboardType: keyboardType,
      obscureText: isPassword,
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
      onChanged: onChanged,
      onTap: onTap,
    ),
  );
}

Widget myExpansionTile({
  required String title,
  List<Widget> children = const <Widget>[],
  double collapsedBorderRadius = 10,
  double borderRadius = 10,
  double padding = 10,
  Color collapsedBackgroundColor = whiteLowOpacity,
  Color backgroundColor = whiteLowOpacity,
}) {
  return ExpansionTile(
    title: Text(
      title,
    ),
    childrenPadding: EdgeInsets.all(padding),
    collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(collapsedBorderRadius)),
    collapsedBackgroundColor: collapsedBackgroundColor,
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius)),
    children: children,
  );
}

// My Choose Container
Future<dynamic> showContainer({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: Text("Apply For School"),
        content: Container(
          child: Column(
            children: [
              Text("Apply for your childeren"),
              SizedBox(
                height: 5,
              ),
              Text("Apply for you"),
            ],
          ),
        ),
        actions: [],
      );
    },
  );
}

Widget showNotEducatedChildren({
  required List<String> children,
  required BuildContext buildContext,
}) {
  return ListView.separated(
    itemBuilder: (context, index) => settingTileWidget(
        withIcon: false,
        title: children[index],
        onTap: () {
          myShowDialog(
            context: buildContext,
            title: "Apply Request",
            content: "Request Has Been Sent Successfully",
          );
        }),
    separatorBuilder: (context, index) => const SizedBox(height: 5),
    itemCount: children.length,
  );
}
