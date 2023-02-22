import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getCubit(context) => BlocProvider.of(context);

  int homeIndex = 0;

  
}
