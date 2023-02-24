import 'dart:ui';

import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/color.dart';

class HomeScreen extends StatelessWidget {
  String userName = 'David Nael';
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

    return Stack(
      children: [
        //! Background Image
        Image.network(
          // "https://e7.pngegg.com/pngimages/915/155/png-clipart-flying-eagles-eagle-fly.png",
          "https://e7.pngegg.com/pngimages/508/257/png-clipart-flag-of-egypt-desktop-google-play-egypt-flag-egypt-thumbnail.png",
          // "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/2560px-Flag_of_Egypt.svg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        //! Frosted Glass Effect
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  //! Profile Picture + Name + National ID
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            //! Avatar
                            CircleAvatar(
                              backgroundColor: myBlueColor.withOpacity(0.7),
                              radius: 40,
                              child: Text(
                                userName[0],
                                style: const TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            //!Name
                            myTitle(
                              title: userName,
                              boxOpacity: 0.8,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //!Phone Number
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: myTitle(
                                title: "Phone Number: $phone",
                                boxOpacity: 0.8,
                              ),
                            ),

                            //! National ID
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: myTitle(
                                title: "National ID: $nid",
                                boxOpacity: 0.8,
                              ),
                            ),

                            //!Wallet
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: myTitle(
                                title: "Balance: $balance",
                                boxOpacity: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        //! Announcement
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
                        SizedBox(
                          height: 50,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    settingTileWidget(
                                      width: 150,
                                      title: "Services",
                                      icon: Icons.build,
                                      onTap: () {},
                                      tileOpacity: 0.8,
                                      borderColor: Colors.black,
                                    ),
                                    settingTileWidget(
                                      width: 150,
                                      title: "My Wallet",
                                      icon: Icons.wallet,
                                      onTap: () {},
                                      tileOpacity: 0.8,
                                      borderColor: Colors.black,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    settingTileWidget(
                                      width: 170,
                                      title: "Pay Taxes",
                                      icon: Icons.attach_money,
                                      onTap: () {},
                                      tileOpacity: 0.8,
                                      borderColor: Colors.black,
                                    ),
                                    settingTileWidget(
                                      width: 140,
                                      title: "Profile",
                                      icon: Icons.person,
                                      onTap: () {},
                                      tileOpacity: 0.8,
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

                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child:
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
