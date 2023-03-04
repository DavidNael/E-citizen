import 'package:ecitizen/models/user_data_model.dart';
import 'package:ecitizen/models/user_education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/ui_components.dart';
import '../../../shared/cubit/app_cubit.dart';
import '../../../shared/cubit/app_states.dart';
import '../../../shared/styles/color.dart';
import '../../login/login_cubit/login_cubit.dart';
import '../../login/login_cubit/login_states.dart';
import 'education_cubit/education_cubit.dart';
import 'education_cubit/education_states.dart';

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
        return BlocConsumer<EducationCubit, EducationStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final EducationCubit educationCubit =
                EducationCubit.getEducationCubit(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //1 School
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                      child: myExpansionTile(
                        title: "School",
                        children: [
                          settingTileWidget(
                            title: "Apply For School",
                            onTap: () {},
                            icon: Icons.school,
                          ),
                          settingTileWidget(
                            title: "Change School",
                            onTap: () {},
                            icon: Icons.school,
                          ),
                          settingTileWidget(
                            title: "Pay School Payment",
                            onTap: () {},
                            icon: Icons.money_rounded,
                          ),
                          settingTileWidget(
                            title: "Show Year Grades",
                            onTap: () {},
                            icon: Icons.document_scanner,
                          ),
                        ],
                      ),
                    ),
                    //2 University
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                        child: myExpansionTile(
                          title: "University",
                          children: [
                            Column(
                              children: [
                                settingTileWidget(
                                  title: "Apply For School",
                                ),
                                settingTileWidget(
                                  title: "Change School",
                                ),
                                settingTileWidget(
                                  title: "Service",
                                ),
                                settingTileWidget(
                                  title: "Service",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //3 PHD
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                        child: myExpansionTile(
                          title: "PHD",
                          children: [
                            Column(
                              children: [
                                settingTileWidget(
                                  title: "Apply For School",
                                ),
                                settingTileWidget(
                                  title: "Change School",
                                ),
                                settingTileWidget(
                                  title: "Service",
                                ),
                                settingTileWidget(
                                  title: "Service",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //4 Master
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                      child: myExpansionTile(
                        title: "Master",
                        children: [
                          Column(
                            children: [
                              settingTileWidget(
                                title: "Apply For School",
                              ),
                              settingTileWidget(
                                title: "Change School",
                              ),
                              settingTileWidget(
                                title: "Service",
                              ),
                              settingTileWidget(
                                title: "Service",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //1 Old Expansion Panel
                //  ExpansionPanelList(

                //   expansionCallback: (int index, bool isExpanded) {
                //     educationCubit.updateIsOpenList(
                //         index: index, isExpanded: !isExpanded);
                //   },
                //   children: [
                //     myExpansionPanel(
                //       title: "School",
                //       isExpanded: educationCubit.isOpenList[0],
                //       body: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           children: [
                //             settingTileWidget(),
                //             settingTileWidget(),
                //             settingTileWidget(),
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ),
            );
          },
        );
      },
    );
  }
}
