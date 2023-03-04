import 'package:ecitizen/layout/home_layout_cubit/home_layout_states.dart';
import 'package:ecitizen/modules/account/account_screen.dart';
import 'package:ecitizen/modules/home_screen/home_screen.dart';
import 'package:ecitizen/modules/services/civil_status_services.dart';
import 'package:ecitizen/modules/services/education/education_service.dart';
import 'package:ecitizen/modules/services/health_service.dart';
import 'package:ecitizen/modules/services/judicial_service.dart';
import 'package:ecitizen/modules/services/land_property_service.dart';
import 'package:ecitizen/modules/services/passport_immigration_service.dart';
import 'package:ecitizen/modules/services/public_utilities_service.dart';
import 'package:ecitizen/modules/services/services_screen.dart';
import 'package:ecitizen/modules/services/social_service.dart';
import 'package:ecitizen/modules/services/taxation_service.dart';
import 'package:ecitizen/modules/services/vehicle_service.dart';
import 'package:ecitizen/modules/settings/settings_screen.dart';
import 'package:ecitizen/shared/components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(InitialState());

  static HomeLayoutCubit getCubit(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ServicesScreen(),
    blurEffect(child: const SettingsScreen()),
    blurEffect(child: const AccountScreen()),
    blurEffect(child: const CivilStatusService()),
    blurEffect(child: const EducationService()),
    blurEffect(child: const HealthServices()),
    blurEffect(child: const JudicialServices()),
    blurEffect(child: const LandPropertyServices()),
    blurEffect(child: const PassportImmigrationServices()),
    blurEffect(child: const PublicUtilitiesService()),
    blurEffect(child: const SocialService()),
    blurEffect(child: const TaxationService()),
    blurEffect(child: const VehicleServices()),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
