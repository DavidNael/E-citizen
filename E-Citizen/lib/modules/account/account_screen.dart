import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = 'David Nael';
    String nid = '2030901516511';
    String phone = '01201215151';
    String balance = '355.0';
    return blurEffect(
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
        ],
      ),
    );
  }
}
