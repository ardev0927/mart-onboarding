import 'package:get/get.dart';
import 'package:mart_onboarding/repository/onboarding_repo.dart';

import '../model/onboarding_model.dart';

class OnBoardingController extends GetxController implements GetxService {
  OnBoardingController({required this.onboardingRepo});
  final OnBoardingRepo onboardingRepo;

  List<OnBoardingModel> _onBoardingList = [];
  List<OnBoardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void getOnBoardingList() async {
    Response response = onboardingRepo.getOnBoardingList();

    if (response.statusCode == 200) {
      _onBoardingList = [];
      _onBoardingList.addAll(response.body);
    } else {}
    update();
  }
}
