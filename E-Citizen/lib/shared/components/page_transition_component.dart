// Navigation button
import 'package:flutter/material.dart';

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
