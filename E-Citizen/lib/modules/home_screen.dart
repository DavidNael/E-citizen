import 'dart:ui';

import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/color.dart';

class HomeScreen extends StatelessWidget {
  String userName = 'David Nael Nady Ahmed Zaydan';
  String nid = '2030901516511';
  String phone = '01201215151';
  String balance = '355.0';
  // const HomeScreen({
  //   super.key,
  //   required this.userName,
  //   required this.nid,
  // });
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;
    // return Column(
    //   children: [
    //     //! Profile Picture + Name + National ID
    //     Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             children: [
    //               //! Avatar
    //               CircleAvatar(
    //                 backgroundColor: myBlueColor,
    //                 radius: 40,
    //                 child: Text(
    //                   userName[0],
    //                   style: const TextStyle(
    //                     fontSize: 45,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ),

    //               const SizedBox(
    //                 height: 10,
    //               ),

    //               //!Name
    //               myTitle(title: userName),
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               //!Phone Number
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 5),
    //                 child: myTitle(title: "Phone Number: $phone"),
    //               ),

    //               //! National ID
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 5),
    //                 child: myTitle(title: "National ID: $nid"),
    //               ),

    //               //!Wallet
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 5),
    //                 child: myTitle(title: "Balance: $balance"),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),

    //     //! Announcement
    //     Expanded(
    //       child: Container(
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           // color: backgroundColor,
    //           borderRadius: BorderRadius.circular(20),
    //           border: Border.all(
    //             color: backgroundColor,
    //           ),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(20.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: const [
    //               Text(
    //                 "Announcements",
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 30,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 25,
    //               ),
    //               Text("No announcements available. ")
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),

    //     //! Quick Access section
    //     Expanded(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Text(
    //               "Quick Access",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 30,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 25,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 settingTileWidget(
    //                   width: 150,
    //                   title: "Services",
    //                   icon: Icons.build,
    //                   onTap: () {},
    //                 ),
    //                 settingTileWidget(
    //                   width: 150,
    //                   title: "My Wallet",
    //                   icon: Icons.wallet,
    //                   onTap: () {},
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 settingTileWidget(
    //                   width: 170,
    //                   title: "Pay Taxes",
    //                   icon: Icons.attach_money,
    //                   onTap: () {},
    //                 ),
    //                 settingTileWidget(
    //                   width: 140,
    //                   title: "Profile",
    //                   icon: Icons.person,
    //                   onTap: () {},
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return blurEffect(
      child: SingleChildScrollView(
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
                                  userName[0],
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
                              title: userName,
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
                          title: "Phone Number: $phone",
                          boxOpacity: 0.5,
                        ),
                      ),

                      //! National ID
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: myTitle(
                          title: "National ID: $nid",
                          boxOpacity: 0.5,
                        ),
                      ),

                      //!Wallet
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: myTitle(
                          title: "Balance: $balance",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          settingTileWidget(
                            width: 150,
                            title: "Services",
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
