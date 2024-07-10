import 'package:get/get.dart';
import 'package:mart_onboarding/controller/onboarding_controller.dart';
import 'package:mart_onboarding/repository/onboarding_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // Repository
  Get.lazyPut(() => OnBoardingRepo());

  // Controller
  Get.lazyPut(() => OnBoardingController(onboardingRepo: Get.find()));
}
