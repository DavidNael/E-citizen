import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return blurEffect(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return settingTileWidget(
              title: "Account",
              icon: Icons.person,
              tileOpacity: 0.8,
              borderColor: Colors.black,
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
