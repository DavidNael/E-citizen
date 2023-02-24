import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecitizen/layout/home_layout_cubit/home_layout_states.dart';
import 'package:ecitizen/modules/account/account_screen.dart';
import 'package:ecitizen/modules/home_screen.dart';
import 'package:ecitizen/modules/services/services_screen.dart';
import 'package:ecitizen/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(InitialState());

  static HomeLayoutCubit getCubit(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ServicesScreen(),
    SettingsScreen(),
    AccountScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
