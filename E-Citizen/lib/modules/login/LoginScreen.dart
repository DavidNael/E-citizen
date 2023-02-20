import 'package:ecitizen/shared/components/components.dart';
import 'package:ecitizen/shared/cubit/cubit.dart';
import 'package:ecitizen/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _NIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Center(
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
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),

                    //!National ID Field
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: myTextFormField(
                        textController: _NIDController,
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.person),
                        label: "National ID",
                        borderRadius: 10,
                        validator: (nid) {
                          cubit.validateNID(nid.toString());
                        },
                      ),
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
                        cubit.validatePassword(password.toString());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: myElevatedButton(
                        text: "Login",
                        onPressed: () {
                          formKey.currentState?.validate();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ;
  }
}
