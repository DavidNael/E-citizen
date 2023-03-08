import 'package:ecitizen/models/user_data_model.dart';
import 'package:ecitizen/modules/login/login_cubit/login_cubit.dart';
import 'package:ecitizen/modules/services/education/education_cubit/education_states.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:ecitizen/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user_education_model.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/components/constants.dart';

class EducationCubit extends Cubit<EducationStates> {
  EducationCubit() : super(EducationInitialState());

  static EducationCubit getEducationCubit(context) => BlocProvider.of(context);

  // To Control Drop-Down Menu
  List<bool> isOpenList = [
    false,
    false,
    false,
    false,
    false,
  ];

  void updateIsOpenList({
    required int index,
    required bool isExpanded,
  }) {
    isOpenList[index] = isExpanded;
    emit(ChangeIsOpenListState());
  }

  // Get All User Not Educated Children
  // List<String> notEducatedChildren = [];
  // void getNotEducationChildren({
  //   required UserDataModel userDataModel,
  //   required BuildContext context,
  // }) async {
  //   AppCubit appCubit = AppCubit.getCubit(context);
  //   LoginCubit loginCubit = LoginCubit.getCubit(context);

  //   List<UserDataModel>? children = await appCubit.getChildren(
  //       childrenIDs: appCubit.userDataModel!.children,);
  //   userDataModel.children.forEach((child) async {
  //     // Get Education Model
  //     UserEducationModel? userEducationModel =
  //         await appCubit.getUserEducationModel(
  //       documentID: loginCubit.documentID!,
  //     );
  //     if (userEducationModel?.userIsEducated == false) {
  //       // Get Child Name
  //       UserDataModel? child =
  //           await appCubit.getUserDataModel(documentID: loginCubit.documentID!);
  //       notEducatedChildren.add("${child!.firstName} + ${child.lastName}");
  //     }
  //   });
  // }
}
