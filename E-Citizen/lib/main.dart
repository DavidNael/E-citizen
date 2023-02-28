import 'package:ecitizen/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecitizen/modules/login/login_cubit/login_cubit.dart';
import 'package:ecitizen/modules/login/login_screen.dart';
import 'package:ecitizen/shared/bloc_observer.dart';
import 'package:ecitizen/shared/cubit/app_cubit.dart';
import 'package:ecitizen/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // this function guarantee that all content of body of main will run then function runApp() will called
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  // createUserEducation(
  //   uid: '88XoFRLIhgSRHcGzMG6pUoEyNBq1',
  //   userBachelor: education[userBachelorField],
  //   userIsEducated: true,
  //   userMaster: education[userMasterField],
  //   userPHD: education[userPHDField],
  //   userSchool: education[userSchoolField],
  // );
  runApp(const ECitizen());
}

class ECitizen extends StatelessWidget {
  const ECitizen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeLayoutCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: lightTheme(),
      ),
    );
  }
}
