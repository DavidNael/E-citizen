import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../components/exceptions.dart';
import 'app_states.dart';

class ECitizenCubit extends Cubit<AppStates> {
  ECitizenCubit() : super(AppInitialState());

  static ECitizenCubit getCubit(context) => BlocProvider.of(context);
}
