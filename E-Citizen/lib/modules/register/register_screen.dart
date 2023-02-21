import 'package:ecitizen/modules/login/login_screen.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:ecitizen/shared/cubit/cubit.dart';
import 'package:ecitizen/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/styles/color.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  double rowWidth = 15;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //Name
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _mNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();

  //Birth
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  //Other
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _martialStatusController =
      TextEditingController();
  final TextEditingController _educationLevelController =
      TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;

    return BlocConsumer<ECitizenCubit, ECitizenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ECitizenCubit.getCubit(context);
        return Scaffold(
          key: scaffoldKey,
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
                                    "Register",
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
                                  prefixIcon: const Icon(Icons.credit_card),
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

                                //! Phone Number Field
                                myTextFormField(
                                  textController: _phoneController,
                                  keyboardType: TextInputType.number,
                                  prefixIcon: const Icon(Icons.phone),
                                  label: "Phone",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Phone can't be empty!";
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

                                //!Register Button
                                myElevatedButton(
                                  text: "Register",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.login(
                                        _nidController.text,
                                        _passwordController.text,
                                      );
                                    }
                                  },
                                ),

                                //!Register Button
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Already have an account ? ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          navigateTo(
                                            context: context,
                                            destination: LoginScreen(),
                                          );
                                        },
                                        child: const Text(
                                          'Login from here',
                                          style: (TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ))
                                  ],
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
