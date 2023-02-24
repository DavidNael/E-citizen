import 'dart:ui';

import 'package:ecitizen/shared/components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/color.dart';
import 'login/login_cubit/login_cubit.dart';
import 'login/login_cubit/login_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final user = LoginCubit.getCubit(buildContext).user!;
        return blurEffect(
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //! Profile Picture + Name + National ID
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //! Avatar
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: myBlueColor.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(20)),
                                  // radius: 60,
                                  child: Center(
                                    child: Text(
                                      user.firstName[0],
                                      style: const TextStyle(
                                        fontSize: 45,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 20,
                              ),

                              //!Name
                              Expanded(
                                child: myTitle(
                                  title: user.firstName,
                                  boxOpacity: 0.5,
                                  fontSize: 25,
                                  maxLines: 3,
                                  isBold: true,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          //!Phone Number
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: myTitle(
                              title: "Phone Number: ${user.phoneNumbers[0]}",
                              boxOpacity: 0.5,
                            ),
                          ),

                          //! National ID
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: myTitle(
                              title: "National ID: ${user.nationalID}",
                              boxOpacity: 0.5,
                            ),
                          ),

                          //!Wallet
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: myTitle(
                              title: "Balance: any value",
                              boxOpacity: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! Announcement
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Announcements",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "No announcements available. ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //! Quick Access section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Quick Access",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          settingTileWidget(
                            width: 200,
                            title: "Birth Certificate",
                            icon: Icons.build,
                            onTap: () {},
                            tileOpacity: 0.5,
                            iconOutlineColor: tileIconOutlineColor,
                            tileColor: tileColor,
                            iconColor: tileIconColor,
                            titleColor: textColor,
                            borderColor: Colors.black,
                          ),
                          settingTileWidget(
                            width: 150,
                            title: "My Wallet",
                            icon: Icons.wallet,
                            onTap: () {},
                            tileOpacity: 0.5,
                            iconOutlineColor: tileIconOutlineColor,
                            tileColor: tileColor,
                            iconColor: tileIconColor,
                            titleColor: textColor,
                            borderColor: Colors.black,
                          ),
                          settingTileWidget(
                            width: 170,
                            title: "Pay Taxes",
                            icon: Icons.attach_money,
                            onTap: () {},
                            tileOpacity: 0.5,
                            iconOutlineColor: tileIconOutlineColor,
                            tileColor: tileColor,
                            iconColor: tileIconColor,
                            titleColor: textColor,
                            borderColor: Colors.black,
                          ),
                          settingTileWidget(
                            width: 140,
                            title: "Profile",
                            icon: Icons.person,
                            onTap: () {},
                            tileOpacity: 0.5,
                            iconOutlineColor: tileIconOutlineColor,
                            tileColor: tileColor,
                            iconColor: tileIconColor,
                            titleColor: textColor,
                            borderColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
