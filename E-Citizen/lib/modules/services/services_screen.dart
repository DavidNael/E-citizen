import 'package:ecitizen/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecitizen/layout/home_layout_cubit/home_layout_states.dart';
import 'package:ecitizen/shared/components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  List<String> services = [
    "Civil Service",
    "Education Service",
    "Health Service",
    "Judical Service",
    "Land Property Service",
    "Passport and Immagration Service",
    "Public Utilities Service",
    "Social Service",
    "Taxation Service",
    "Vehicle Service",
  ];
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit homeLayoutCubit =
            HomeLayoutCubit.getCubit(buildContext);
        return Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
            left: 25,
            right: 25,
          ),
          child: GridView.builder(
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 150,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return buildService2(
                serviceName: services[index],
                serviceImagePath: "",
                onTap: () {
                  homeLayoutCubit.changeIndex(index + 4);
                },
              );
            },
          ),
        );
      },
    );
    //! List View
    // ListView.separated(
    //   itemBuilder: (context, index) => buildService2(
    //       serviceName: services[index].serviceName,
    //       onTap: () {
    //         navigateAndReplace(
    //             context: buildContext,
    //             destination: services[index].serviceScreen);
    //       }),
    //   separatorBuilder: (context, index) => const SizedBox(
    //     height: 15,
    //   ),
    //   itemCount: services.length,
    // ),
  }
}
