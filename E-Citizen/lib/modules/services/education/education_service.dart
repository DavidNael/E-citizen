import 'package:ecitizen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/ui_components.dart';
import '../../../shared/cubit/app_cubit.dart';
import '../../../shared/cubit/app_states.dart';
import '../../education_ministry.dart';
import 'education_cubit/education_cubit.dart';
import 'education_cubit/education_states.dart';

// ignore: must_be_immutable
class EducationService extends StatelessWidget {
  TextEditingController schoolNameContoleer = TextEditingController();
  TextEditingController visaCardContoller = TextEditingController();

  EducationService({super.key});
  @override
  Widget build(BuildContext context) {
    final BuildContext buildContext = context;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.getCubit(context);
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
                          //7 Apply For School
                          userEducationModel.userIsEducated == false
                              ? settingTileWidget(
                                  title: "Apply for school",
                                  onTap: () {
                                    myFormDialog2(
                                      context: context,
                                      textController: schoolNameContoleer,
                                      keyboardType: TextInputType.text,
                                      label: "Enter school name",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "School name must not be empty!";
                                        }
                                        return null;
                                      },
                                      okWidget: () {
                                        myShowDialog(
                                          context: context,
                                          title: "Apply for school",
                                          content: "Successful request",
                                        );
                                      },
                                    );
                                  },
                                  icon: Icons.school,
                                )
                              : const SizedBox.shrink(),

                          //7 Apply For School - Children
                          educationCubit.notEducatedChildren.isNotEmpty
                              ? settingTileWidget(
                                  title: "Apply for school for your children",
                                  onTap: () {
                                    // Show children names
                                    // ignore: use_build_context_synchronously
                                    myShowDialog2(
                                      context: buildContext,
                                      title: "",
                                      content: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);

                                            // Enter school name
                                            myFormDialog2(
                                              context: buildContext,
                                              textController:
                                                  schoolNameContoleer,
                                              keyboardType: TextInputType.text,
                                              label: "Enter school name",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "School name must not be empty!";
                                                }
                                                return null;
                                              },
                                              okWidget:
                                                  // ignore: use_build_context_synchronously
                                                  () {
                                                myShowDialog(
                                                  context: buildContext,
                                                  title: "",
                                                  content:
                                                      "Request sent successfully!",
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            educationCubit
                                                .notEducatedChildren[index],
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 5),
                                        itemCount: educationCubit
                                            .notEducatedChildren.length,
                                      ),
                                    );
                                    // ignore: use_build_context_synchronously
                                  },
                                  icon: Icons.school,
                                )
                              : const SizedBox.shrink(),

                          //7 Change School
                          userEducationModel.userIsEducated &&
                                  userEducationModel.userSchool[
                                          userSecondarySchoolGraduatedField] ==
                                      false
                              ? settingTileWidget(
                                  title: "Change School",
                                  onTap: () {},
                                  icon: Icons.school,
                                )
                              : const SizedBox.shrink(),

                          //7 Change School - Children
                          educationCubit.educatedChildren.isNotEmpty
                              ? settingTileWidget(
                                  title: "Change school for you children",
                                  onTap: () {
                                    // Show children names
                                    // ignore: use_build_context_synchronously
                                    myShowDialog2(
                                      context: buildContext,
                                      title: "",
                                      content: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);

                                            // Enter school name
                                            myFormDialog2(
                                              context: buildContext,
                                              textController:
                                                  schoolNameContoleer,
                                              keyboardType: TextInputType.text,
                                              label: "Enter school name",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "School name must not be empty!";
                                                }
                                                return null;
                                              },
                                              okWidget: () {
                                                myShowDialog(
                                                  context: buildContext,
                                                  title: "",
                                                  content:
                                                      "Request sent successfully!",
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            educationCubit
                                                .educatedChildren[index],
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 5),
                                        itemCount: educationCubit
                                            .educatedChildren.length,
                                      ),
                                    );
                                    // ignore: use_build_context_synchronously
                                  },
                                  icon: Icons.school,
                                )
                              : const SizedBox.shrink(),

                          //7 Pay School
                          settingTileWidget(
                            title: "School payment",
                            onTap: () {
                              paymentWidget(
                                  buildContext: buildContext,
                                  visaCardContoller: visaCardContoller,
                                  context: context);
                            },
                            icon: Icons.money_rounded,
                          ),
                          //7 Show Year Grades
                          userEducationModel.userSchool[
                                              userPreparatorySchoolField]
                                          [userPreparatorySchoolLevelField] ==
                                      3 ||
                                  userEducationModel.userSchool[
                                              userPreparatorySchoolField]
                                          [userSecondarySchoolLevelField] ==
                                      3
                              ? settingTileWidget(
                                  title: "Show year grades",
                                  onTap: () {
                                    Navigator.push(
                                      buildContext,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const EducationMinistryWebView(
                                          "https://moe.gov.eg/",
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.document_scanner,
                                )
                              : const SizedBox.shrink(),
                          //7 Request enrollment certificate
                          userEducationModel
                                          .userSchool[userSecondarySchoolField]
                                      [userSecondarySchoolLevelField] <=
                                  3
                              ? settingTileWidget(
                                  title: "Request enrollment certificate",
                                  onTap: () {
                                    paymentWidget(
                                      buildContext: buildContext,
                                      visaCardContoller: visaCardContoller,
                                      context: context,
                                    );
                                  },
                                  icon: Icons.description_sharp)
                              : const SizedBox.shrink(),
                          //7 Request enrollment certificate - children
                          educationCubit.educatedChildren.isNotEmpty
                              ? settingTileWidget(
                                  title:
                                      "Request enrollment certificate for your children",
                                  onTap: () {
                                    myShowDialog2(
                                      context: buildContext,
                                      title: "",
                                      content: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);

                                            // Enter payment method
                                            paymentWidget(
                                              popWidget: true,
                                              buildContext: context,
                                              visaCardContoller:
                                                  visaCardContoller,
                                              context: context,
                                            );
                                          },
                                          child: Text(
                                            educationCubit
                                                .educatedChildren[index],
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 5),
                                        itemCount: educationCubit
                                            .educatedChildren.length,
                                      ),
                                    );
                                  },
                                  icon: Icons.description_sharp)
                              : const SizedBox.shrink(),
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
                                //7 Apply for university
                                userEducationModel.userBachelor[
                                            userHaveBachelorField] ==
                                        false
                                    ? settingTileWidget(
                                        title: "Apply for university",
                                      )
                                    : const SizedBox.shrink(),

                                //7 Change university
                                userEducationModel.userBachelor[
                                                userHaveBachelorField] ==
                                            false &&
                                        userEducationModel.userBachelor[
                                                userBachelorLevelField] >
                                            0
                                    ? settingTileWidget(
                                        title: "Change university",
                                        icon: Icons.school_rounded,
                                      )
                                    : const SizedBox.shrink(),

                                //7 Pay university bills
                                settingTileWidget(
                                  title: "Pay bills",
                                  onTap: () {},
                                  icon: Icons.money_rounded,
                                ),

                                //7 Request enrollment certificate
                                settingTileWidget(
                                  title: "Request enrollment certificate",
                                  //8 should pay for request
                                  onTap: () {},
                                  icon: Icons.description_sharp,
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
              ),
            );
          },
        );
      },
    );
  }
}
