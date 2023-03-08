import 'package:ecitizen/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecitizen/modules/login/login_cubit/login_cubit.dart';
import 'package:ecitizen/modules/login/login_screen.dart';
import 'package:ecitizen/modules/services/education/education_cubit/education_cubit.dart';
import 'package:ecitizen/shared/bloc_observer.dart';
import 'package:ecitizen/shared/components/constants.dart';
import 'package:ecitizen/shared/cubit/app_cubit.dart';
import 'package:ecitizen/shared/styles/themes.dart';
import 'package:ecitizen/temps/create_user_logic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // this function guarantee that all content of body of main will run then function runApp() will called
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();

  //7 create user
  // createUserData(
  //   uid: "0cdw4P94FPYJBKNXlH32UDdlZ9a2",
  //   birthDate: "20-3-2012",
  //   birthPlace: "Giza",
  //   martialStatus: martial,
  //   fatherName: "Ahmed",
  //   motherName: "Hala",
  //   firstName: "Ashraf",
  //   gender: true,
  //   nationalID: "00301111222233",
  //   jobs: jobs,
  //   phoneNumbers: phones,
  //   addresses: addresses,
  //   children: [],
  // );

  createUserEducation(
    nationalID: "00301111222233",
    userIsEducated: true,
    userSchool: education[userSchoolField],
    userBachelor: education[userBachelorField],
    userPHD: education[userPHDField],
    userMaster: education[userMasterField],
  );
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
        BlocProvider(
          create: (context) => EducationCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: lightTheme(),
      ),
    );
  }
}
