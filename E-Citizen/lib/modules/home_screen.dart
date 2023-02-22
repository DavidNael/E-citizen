import 'package:ecitizen/modules/services/passport_immigration_service.dart';
import 'package:ecitizen/modules/services/public_utilities_service.dart';
import 'package:ecitizen/modules/services/service_model.dart';
import 'package:ecitizen/modules/services/social_service.dart';
import 'package:ecitizen/modules/services/taxation_service.dart';
import 'package:ecitizen/modules/services/vehicle_service.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../shared/styles/color.dart';

class HomeScreen extends StatelessWidget {
  String userName = 'David Nael';
  String nid = '02034832343 3';
  // const HomeScreen({
  //   super.key,
  //   required this.userName,
  //   required this.nid,
  // });
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //! Profile Picture + Name + National ID
            Container(
                padding: const EdgeInsets.all(18),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                      child: Text(
                        "D",
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    //! Name + National ID
                    Column(
                      children: [
                        //! Name
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(userName),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //! Natioanl ID
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(nid),
                          ),
                        ),
                      ],
                    )
                  ],
                )),

            const SizedBox(
              height: 10,
            ),

            //! Announcement
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(18),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Announcement',
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //! Services section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(18),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Announcement',
                ),
              ),
            ),
          ],
        ));
  }
}
