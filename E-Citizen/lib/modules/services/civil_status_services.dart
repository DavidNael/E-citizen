import 'package:ecitizen/shared/components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CivilStatusService extends StatelessWidget {
  const CivilStatusService({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Change Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: settingTileWidget(
                  title: 'Change Name',
                  icon: Icons.supervisor_account_rounded,
                  onTap: () {
                    myShowDialog(
                        context: context,
                        title: 'Change Name Request',
                        content:
                            'Change name request has seen successfully sent.');
                  }),
            ),

            // Birth Certificate
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: settingTileWidget(
                  title: 'Request Birth Certificate',
                  icon: Icons.mood,
                  onTap: () {
                    myShowDialog(
                        context: context,
                        title: 'Birth Certificate Request',
                        content:
                            'Birth certificate request has seen successfully sent.');
                  }),
            ),

            // Death Certificate
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: settingTileWidget(
                  title: 'Request Death Certificate',
                  icon: Icons.sentiment_dissatisfied,
                  onTap: () {
                    myShowDialog(
                        context: context,
                        title: 'Death Certificate Request',
                        content:
                            'Death certificate request has seen successfully sent.');
                  }),
            ),

            // Marriage
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: settingTileWidget(
                  title: 'Apply Marriage - Edit later',
                  icon: Icons.family_restroom,
                  onTap: () {
                    myShowDialog(
                        context: context,
                        title: 'Marriage Request',
                        content:
                            'Marriage request has seen successfully sent.');
                  }),
            ),

            // Divorce
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: settingTileWidget(
                  title: 'Request Divorce Form - Edit later',
                  icon: Icons.balance,
                  onTap: () {
                    myShowDialog(
                        context: context,
                        title: 'Divorce Request',
                        content: 'Divorce request has seen successfully sent.');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
