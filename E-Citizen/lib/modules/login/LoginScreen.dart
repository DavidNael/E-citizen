import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/styles/color.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _NIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
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
                          if (nid.toString().length != 14) {
                            return "National ID must be 14 digits.";
                          }
                          return null;
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
                        if (!validatePassword(password.toString())) {
                          return "Weak Password. password must contain numerical digit and at least 8 characters long.";
                        }
                        return null;
                      },
                    ),
                    myElevatedButton(
                      text: "Login",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
