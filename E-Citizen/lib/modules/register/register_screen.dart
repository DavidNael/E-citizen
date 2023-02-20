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

                          /// First Name + Last Name
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //! First Name Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _fNameController,
                                  keyboardType: TextInputType.name,
                                  prefixIcon: const Icon(Icons.person),
                                  label: "First Name",
                                  borderRadius: 10,
                                  width: 20,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "First Name can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                width: rowWidth,
                              ),

                              //! Last Name Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _lNameController,
                                  keyboardType: TextInputType.name,
                                  prefixIcon: const Icon(Icons.person),
                                  label: "Last Name",
                                  borderRadius: 10,
                                  width: 20,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Last Name can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          /// Father Name + Mother Name
                          Row(
                            children: [
                              //! Mother Name Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _motherNameController,
                                  keyboardType: TextInputType.name,
                                  prefixIcon: const Icon(Icons.person_2),
                                  label: "Mother Name",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Mother Name can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                width: rowWidth,
                              ),

                              //! Father Name Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _fatherNameController,
                                  keyboardType: TextInputType.name,
                                  prefixIcon: const Icon(Icons.person),
                                  label: "Father Name",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Father Name can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          /// Birth Place + Date of Birth
                          Row(
                            children: [
                              //! Birth Place Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _birthPlaceController,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: const Icon(Icons.place),
                                  label: "Birth Place",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Birth Place can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                width: rowWidth,
                              ),

                              //! Date Of Birth Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _dateOfBirthController,
                                  keyboardType: TextInputType.datetime,
                                  prefixIcon: const Icon(Icons.date_range),
                                  label: "Date Of Birth",
                                  borderRadius: 10,
                                  myOnTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse("2030-12-30"),
                                    ).then((value) {
                                      if (value != null) {
                                        _dateOfBirthController.text =
                                            DateFormat.yMMMMd().format(value);
                                      }
                                    });
                                  },
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Date Of Birth can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          /// National ID + Phone Number
                          Row(
                            children: [
                              //!National ID Field
                              Expanded(
                                child: myTextFormField(
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
                              ),

                              SizedBox(
                                width: rowWidth,
                              ),

                              //! Phone Number Field
                              Expanded(
                                child: myTextFormField(
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
                              ),
                            ],
                          ),

                          /// Gender + Martial Status
                          Row(
                            children: [
                              //! Gender Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _genderController,
                                  keyboardType: TextInputType.number,
                                  prefixIcon: const Icon(Icons.transgender_sharp),
                                  label: "Gender",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Gender can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                width: rowWidth,
                              ),

                              //! Martial Status Field
                              Expanded(
                                child: myTextFormField(
                                  textController: _martialStatusController,
                                  keyboardType: TextInputType.number,
                                  prefixIcon: const Icon(Icons.family_restroom),
                                  label: "Martial Status",
                                  borderRadius: 10,
                                  validator: (nid) {
                                    if (nid.toString().isEmpty) {
                                      return "Martial Status can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),


                          //! Address Field
                          myTextFormField(
                            textController: _addressController,
                            keyboardType: TextInputType.text,
                            prefixIcon: const Icon(Icons.location_city),
                            label: "Address",
                            borderRadius: 10,
                            validator: (nid) {
                              if (nid.toString().isEmpty) {
                                return "Address can't be empty!";
                              }
                              return null;
                            },
                          ),

                          //todo Blood Type Field

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
        );
      },
    );
  }
}
