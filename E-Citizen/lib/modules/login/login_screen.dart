import 'package:ecitizen/layout/home_layout_screen.dart';
import 'package:ecitizen/modules/login/login_cubit/login_cubit.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/exceptions.dart';
import '../../shared/styles/color.dart';
import 'login_cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          if (state.exception is WrongPasswordAuthException) {
            myShowDialog(
              context: buildContext,
              title: "Wrong Password",
              content: "The password you've entered is not correct.",
            );
          }
        }
      },
      builder: (context, state) {
        final cubit = LoginCubit.getCubit(context);
        return Scaffold(
          backgroundColor: color1,
          body: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //! Title
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),

                                //!National ID Field
                                myTextFormField(
                                  textController: _nidController,
                                  keyboardType: TextInputType.number,
                                  prefixIcon: const Icon(Icons.person),
                                  label: "National ID",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "National ID can't be empty!";
                                    } else if (nid.toString().length != 14) {
                                      return "National ID must be 14 digits long";
                                    }
                                    return null;
                                  },
                                ),
                                //! Password Field
                                myTextFormField(
                                  textController: _passwordController,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: const Icon(Icons.lock),
                                  isPassword: true,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.remove_red_eye),
                                    onPressed: () {},
                                  ),
                                  label: "Password",
                                  borderRadius: 10,
                                  validator: (password) {
                                    if (password.toString().isEmpty) {
                                      return "Password can't be empty!";
                                    } else if (!passwordValidator(
                                        password.toString())) {
                                      return "Weak Password. password must contain numerical digit and at least 8 characters long.";
                                    }
                                    return null;
                                  },
                                ),

                                //! Login Button
                                myElevatedButton(
                                  text: "Login",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      navigateAndReplace(
                                        context: buildContext,
                                        destination: const HomeLayoutScreen(),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
