import 'package:ecitizen/modules/services/services_screen.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:ecitizen/shared/styles/color.dart';
import 'package:flutter/material.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Profile Picture
                const CircleAvatar(
                  backgroundColor: myBlueColor,
                  radius: 40,
                  child: Text(
                    "D",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
                myElevatedButton(
                  text: "Edit",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 100,
                ),
                myElevatedButton(text: "Function 1", onPressed: () {}),
                myElevatedButton(text: "Function 2", onPressed: () {}),
                myElevatedButton(text: "Function 3", onPressed: () {}),
                myElevatedButton(text: "Function 4", onPressed: () {}),
                myElevatedButton(text: "Function 5", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
      body: ServicesScreen(),
    );
  }
}
