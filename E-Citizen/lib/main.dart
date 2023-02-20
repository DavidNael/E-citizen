import 'package:ecitizen/modules/login/LoginScreen.dart';
import 'package:ecitizen/shared/cubit/cubit.dart';
import 'package:ecitizen/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ECitizen());
}

class ECitizen extends StatelessWidget {
  const ECitizen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ECitizenCubit(),
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
