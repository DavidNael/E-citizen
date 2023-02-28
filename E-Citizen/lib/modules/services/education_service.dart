import 'package:ecitizen/models/user_data_model.dart';
import 'package:ecitizen/models/user_education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/ui_components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_states.dart';
import '../../shared/styles/color.dart';
import '../login/login_cubit/login_cubit.dart';
import '../login/login_cubit/login_states.dart';

class EducationService extends StatelessWidget {
  const EducationService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.getCubit(context);
        final userDataModel = appCubit.userDataModel!;
        final userEducationModel = appCubit.userEducationModel!;
        return BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      //! Profile Picture + Name + National ID
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
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
                                        border: Border.all(color: Colors.black),
                                        color: myBlueColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    // radius: 60,
                                    child: Center(
                                      child: Text(
                                        userDataModel.firstName[0],
                                        style: const TextStyle(
                                          fontSize: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 20,
                                ),

                                //!Name
                                Expanded(
                                  child: myTitle(
                                    title: userDataModel.firstName,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
