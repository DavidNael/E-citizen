import 'package:ecitizen/modules/services/passport_immigration_service.dart';
import 'package:ecitizen/modules/services/public_utilities_service.dart';
import 'package:ecitizen/modules/services/service_model.dart';
import 'package:ecitizen/modules/services/social_service.dart';
import 'package:ecitizen/modules/services/taxation_service.dart';
import 'package:ecitizen/modules/services/vehicle_service.dart';
import 'package:ecitizen/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../shared/styles/color.dart';
import 'civil_status_services.dart';
import 'education_service.dart';
import 'emergency_disaster_service.dart';
import 'health_service.dart';
import 'judicial_service.dart';
import 'land_property_service.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  List<AppService> services = [
    AppService(
      serviceName: "Civil Status",
      serviceScreen: const CivilStatusService(),
    ),
    AppService(
      serviceName: "Education Status",
      serviceScreen: const EducationService(),
    ),
    AppService(
      serviceName: "Emergency Status",
      serviceScreen: const EmergencyDisasterService(),
    ),
    AppService(
      serviceName: "Health Status",
      serviceScreen: const HealthServices(),
    ),
    AppService(
      serviceName: "Judical Status",
      serviceScreen: const JudicialServices(),
    ),
    AppService(
      serviceName: "Land Property Status",
      serviceScreen: const LandPropertyServices(),
    ),
    AppService(
      serviceName: "Passport and Immagration Service",
      serviceScreen: const PassportImmigrationServices(),
    ),
    AppService(
      serviceName: "Public Utilities Service",
      serviceScreen: const PublicUtilitiesService(),
    ),
    AppService(
      serviceName: "Social Service",
      serviceScreen: SocialService(),
    ),
    AppService(
      serviceName: "Taxation Service",
      serviceScreen: TaxationService(),
    ),
    AppService(
      serviceName: "Vehicle Service",
      serviceScreen: VehicleServices(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    BuildContext buildContext = context;
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //! Profile Picture + Name + National ID
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: myBlueColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("David Nael Nady"),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("00000000000000"),
                          ),
                        ],
                      )
                    ],
                  )),
            ),

            // //!Grid View
            // GridView.builder(
            //   itemCount: services.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 200,
            //     mainAxisSpacing: 5,
            //     crossAxisSpacing: 5,
            //   ),
            //   itemBuilder: (context, index) {
            //     return buildService2(
            //         serviceImagePath: '',
            //         serviceName: services[index].serviceName,
            //         onTap: () {
            //           navigateAndReplace(
            //               context: buildContext,
            //               destination: services[index].serviceScreen);
            //         });
            //   },
            // ),
          ],
        )
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
        );
  }
}