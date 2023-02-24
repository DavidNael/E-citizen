import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/models/user_model.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getCubit(context) => BlocProvider.of(context);

  
}
