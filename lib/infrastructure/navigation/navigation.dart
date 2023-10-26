import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => AuthenticationScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => LandingScreen(),
      binding: LandingControllerBinding(),
    ),
    GetPage(
      name: Routes.PERSONAL_INFO,
      page: () => PersonalInfoScreen(),
      binding: PersonalInfoControllerBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION,
      page: () => VerificationScreen(),
      binding: VerificationControllerBinding(),
    ),
    GetPage(
      name: Routes.CREATE_PIN,
      page: () => CreatePinScreen(),
      binding: CreatePinControllerBinding(),
    ),
    GetPage(
      name: Routes.INPUT_PIN,
      page: () => InputPinScreen(),
      binding: InputPinControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInScreen(),
      binding: SignInControllerBinding(),
    ),
    GetPage(
      name: Routes.CARD_CENTER,
      page: () => CardCenterScreen(),
      binding: CardCenterControllerBinding(),
    ),
    GetPage(
      name: Routes.TEST,
      page: () => TestScreen(),
      binding: TestControllerBinding(),
    ),
    GetPage(
      name: Routes.SEND,
      page: () => SendScreen(),
      binding: SendControllerBinding(),
    ),
  ];
}
