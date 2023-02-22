import 'package:flutter_bloc/flutter_bloc.dart';


import 'app_states.dart';

class ECitizenCubit extends Cubit<AppStates> {
  ECitizenCubit() : super(AppInitialState());

  static ECitizenCubit getCubit(context) => BlocProvider.of(context);
}
