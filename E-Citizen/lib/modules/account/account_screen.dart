import 'package:ecitizen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/ui_components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_states.dart';
import '../../shared/styles/color.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final user = AppCubit.getCubit(buildContext).userDataModel!;
        final education = AppCubit.getCubit(buildContext).userEducationModel!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                //1 Profile Picture + Name
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //1 Avatar
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: myBlueColor,
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
                        ),
                        //1 Name
                        Center(
                          child: myTitle(
                            title: user.firstName,
                            fontSize: 25,
                            maxLines: 3,
                            isBold: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //2 Personal Information
                        const Divider(
                          height: 4,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Center(
                          child: myTitle(
                            title: "Personal Information",
                            fontSize: 20,
                            isBold: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //1 Full Name
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: myTextField(
                            textController: TextEditingController(),
                            label: "Name",
                            borderRadius: 10,
                            defaultValue: user.firstName,
                            isEnabled: false,
                          ),
                        ),
                        //1 Full Father Name
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: myTextField(
                            textController: TextEditingController(),
                            label: "Father Name",
                            borderRadius: 10,
                            defaultValue: user.fatherName,
                            isEnabled: false,
                          ),
                        ),
                        //1 Full Mother Name
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: myTextField(
                            textController: TextEditingController(),
                            label: "Mother Name",
                            borderRadius: 10,
                            defaultValue: user.motherName,
                            isEnabled: false,
                          ),
                        ),

                        //1 National ID
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: myTextField(
                            textController: TextEditingController(),
                            label: "National ID",
                            borderRadius: 10,
                            defaultValue: user.nationalID,
                            isEnabled: false,
                          ),
                        ),

                        myExpansionTile(title: "Education", children: [
                          myExpansionTile(
                            title: "School",
                            children: [
                              //1 Primary School Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "Primary School",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userSchool[userPrimarySchoolField][userPrimarySchoolNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 Preparatory School Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "Preparatory School",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userSchool[userPreparatorySchoolField][userPreparatorySchoolNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 Secondary School Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "Secondary School",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userSchool[userSecondarySchoolField][userSecondarySchoolNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                          myExpansionTile(
                            title: "University",
                            children: [
                              //1 University Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "University Name",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userBachelor[userBachelorUniversityField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 University Level
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "University Level",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userBachelor[userBachelorLevelField]}",
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                          myExpansionTile(
                            title: "PHD",
                            children: [
                              //1 PHD Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "PHD Name",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userPHD[userPHDNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 PHD University
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "PHD University",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userPHD[userPHDUniversityField]}",
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                          myExpansionTile(
                            title: "Master",
                            children: [],
                          ),
                        ]),
                        SizedBox(
                          height: 5,
                        ),
                        myExpansionTile(title: "Health", children: [
                          myExpansionTile(
                            title: "School",
                            children: [
                              //1 Primary School Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "Primary School",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userSchool[userPrimarySchoolField][userPrimarySchoolNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 Preparatory School Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "Preparatory School",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userSchool[userPreparatorySchoolField][userPreparatorySchoolNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 Secondary School Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "Secondary School",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userSchool[userSecondarySchoolField][userSecondarySchoolNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                          myExpansionTile(
                            title: "University",
                            children: [
                              //1 University Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "University Name",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userBachelor[userBachelorUniversityField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 University Level
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "University Level",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userBachelor[userBachelorLevelField]}",
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                          myExpansionTile(
                            title: "PHD",
                            children: [
                              //1 PHD Name
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "PHD Name",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userPHD[userPHDNameField]}",
                                  isEnabled: false,
                                ),
                              ),
                              //1 PHD University
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: myTextField(
                                  textController: TextEditingController(),
                                  label: "PHD University",
                                  borderRadius: 10,
                                  defaultValue:
                                      "${education.userPHD[userPHDUniversityField]}",
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                          myExpansionTile(
                            title: "Master",
                            children: [],
                          ),
                        ])
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                // //2 Education Tab
                // Container(
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.white.withOpacity(0.8),
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset:
                //             const Offset(0, 3), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Center(
                //           child: myTitle(
                //             title: "Education Information",
                //             fontSize: 20,
                //             isBold: true,
                //             textAlign: TextAlign.center,
                //           ),
                //         ),
                //         //2 School Tab
                //         const SizedBox(
                //           height: 10,
                //         ),
                //         const Divider(
                //           height: 4,
                //           thickness: 1,
                //           color: Colors.black,
                //         ),
                //         Center(
                //           child: myTitle(
                //               title: "School",
                //               isBold: true,
                //               textAlign: TextAlign.center),
                //         ),
                //         //1 Primary School Name
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "Primary School",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userSchool[userPrimarySchoolField][userPrimarySchoolNameField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //         //1 Preparatory School Name
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "Preparatory School",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userSchool[userPreparatorySchoolField][userPreparatorySchoolNameField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //         //1 Secondary School Name
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "Secondary School",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userSchool[userSecondarySchoolField][userSecondarySchoolNameField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //         //2 University Tab
                //         const SizedBox(
                //           height: 10,
                //         ),
                //         const Divider(
                //           height: 4,
                //           thickness: 1,
                //           color: Colors.black,
                //         ),
                //         //1 Title
                //         Center(
                //           child: myTitle(
                //               title: "University",
                //               isBold: true,
                //               textAlign: TextAlign.center),
                //         ),
                //         //1 University Name
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "University Name",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userBachelor[userBachelorUniversityField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //         //1 University Level
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "University Level",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userBachelor[userBachelorLevelField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //         //2 PHD Tab
                //         const SizedBox(
                //           height: 10,
                //         ),
                //         const Divider(
                //           height: 4,
                //           thickness: 1,
                //           color: Colors.black,
                //         ),
                //         //1 Title
                //         Center(
                //           child: myTitle(
                //               title: "PHD",
                //               isBold: true,
                //               textAlign: TextAlign.center),
                //         ),
                //         //1 PHD Name
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "PHD Name",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userPHD[userPHDNameField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //         //1 PHD University
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 5),
                //           child: myTextField(
                //             textController: TextEditingController(),
                //             label: "PHD University",
                //             borderRadius: 10,
                //             defaultValue:
                //                 "${education.userPHD[userPHDUniversityField]}",
                //             isEnabled: false,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
