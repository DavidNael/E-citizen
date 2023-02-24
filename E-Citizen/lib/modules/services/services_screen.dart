import 'package:ecitizen/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecitizen/layout/home_layout_cubit/home_layout_states.dart';
import 'package:ecitizen/shared/components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  List<String> services = [
    "Civil Status",
    "Education Status",
    "Emergency Status",
    "Health Status",
    "Judical Status",
    "Land Property Status",
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
        return blurEffect(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
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
        ));
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
