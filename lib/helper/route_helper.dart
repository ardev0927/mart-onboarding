import 'package:get/get.dart';

import '../screen/onboarding_screen.dart';

class RouteHelper {
  static const String onBoarding = '/on-boarding';

  static String getOnBoardingRoute() => onBoarding;

  static List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
  ];
}
