import 'package:ecitizen/modules/services/education/education_cubit/education_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationCubit extends Cubit<EducationStates> {
  EducationCubit() : super(EducationInitialState());

  static EducationCubit getEducationCubit(context) => BlocProvider.of(context);

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
}
