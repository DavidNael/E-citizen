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
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded2) {
                    educationCubit.updateIsOpenList(index: index, isExpanded: isExpanded2);
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text('title'),
                        );
                      },
                      body: Text('Hello'),
                      isExpanded: educationCubit.isOpenList[0],
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
