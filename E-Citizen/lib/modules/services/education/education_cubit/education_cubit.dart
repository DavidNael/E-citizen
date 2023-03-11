import 'package:ecitizen/models/user_data_model.dart';
import 'package:ecitizen/modules/services/education/education_cubit/education_states.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:ecitizen/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user_education_model.dart';


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

  List<String> notEducatedChildren = [];
  void getNotEducatedChildren({
    required String nid,
    required BuildContext context,
  }) async {
    AppCubit appCubit = AppCubit.getCubit(context);

    // Get children of user
    List<dynamic> children = await appCubit.getChildren(userNID: nid);

    // From this children list excute all not educated children
    for (String childNID in children) {
      UserDataModel? childTmp = await appCubit.getUserDataModel(
        nid: childNID,
      );
      // print(childTmp!.fullName);
      UserEducationModel? childEducationModel =
          await appCubit.getUserEducationModel(
        nid: childNID,
      );
      // print(childEducationModel.)
      if (childEducationModel!.userIsEducated == false) {
        notEducatedChildren.add(childTmp!.fullName);
      }
    }
  }

  List<String> educatedChildren = [];
  void getEducatedChildren({
    required String nid,
    required BuildContext context,
  }) async {
    AppCubit appCubit = AppCubit.getCubit(context);

    // Get children of user
    List<dynamic> children = await appCubit.getChildren(userNID: nid);

    // From this children list excute all educated children
    for (String childNID in children) {
      UserDataModel? childTmp = await appCubit.getUserDataModel(
        nid: childNID,
      );
      UserEducationModel? childEducationModel =
          await appCubit.getUserEducationModel(
        nid: childNID,
      );
      if (childEducationModel!.userIsEducated == true &&
          childEducationModel.userSchool[userSecondarySchoolField]
                  [userSecondarySchoolLevelField] <=
              3) {
        educatedChildren.add(childTmp!.fullName);
      }
    }
  }
}
