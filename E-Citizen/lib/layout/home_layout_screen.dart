import 'package:ecitizen/modules/home_screen.dart';
import 'package:ecitizen/modules/login/login_screen.dart';
import 'package:ecitizen/modules/services/services_screen.dart';
import 'package:ecitizen/shared/components/ui_components.dart';
import 'package:ecitizen/shared/cubit/app_cubit.dart';
import 'package:ecitizen/shared/cubit/app_states.dart';
import 'package:ecitizen/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/page_transition_component.dart';
import 'home_layout_cubit/home_layout_cubit.dart';
import 'home_layout_cubit/home_layout_states.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = "David";
    final buildContext = context;
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeLayoutCubit.getCubit(buildContext);

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   iconTheme: IconThemeData(
            //     color: Colors.white,
            //   ),
            //   title: const Text(
            //     'Home Screen',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),

            //! Sidebar menu
            drawer: SafeArea(
              child: Drawer(
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
                backgroundColor: Colors.white.withOpacity(0.8),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        //Profile Picture
                        const CircleAvatar(
                          backgroundColor: myBlueColor,
                          radius: 40,
                          child: Text(
                            "D",
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Welcome Back,",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          username,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 75),
                        const Divider(color: Colors.black, thickness: 2),
                        settingTileWidget(
                          title: "Account",
                          icon: Icons.person,
                          onTap: () {},
                        ),

                        settingTileWidget(
                          title: "Wallet",
                          icon: Icons.credit_card,
                          onTap: () {},
                        ),

                        settingTileWidget(
                          title: "Settings",
                          icon: Icons.settings,
                          onTap: () {},
                        ),

                        settingTileWidget(
                          title: "About",
                          icon: Icons.info,
                          onTap: () {},
                        ),

                        settingTileWidget(
                          title: "Logout",
                          icon: Icons.exit_to_app,
                          onTap: () {
                            navigateAndReplace(
                              context: context,
                              destination: LoginScreen(),
                            );
                          },
                        ),
                        const Spacer(),

                        myTitle(title: "V1.0"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //! Homepage
            // body: HomeScreen(),

            body: cubit.screens[cubit.currentIndex],
            drawerEdgeDragWidth: 80,
            bottomNavigationBar: BottomNavigationBar(
              
                onTap: (value) {
                  cubit.changeNavBar(value);
                },
                currentIndex: cubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Services",
                    icon: Icon(Icons.build),
                  ),
                  BottomNavigationBarItem(
                    label: "Settings",
                    icon: Icon(Icons.settings),
                  ),
                  BottomNavigationBarItem(
                    label: "Account",
                    icon: Icon(Icons.person),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
