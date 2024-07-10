import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mart_onboarding/controller/onboarding_controller.dart';

import '../util/dimensions.dart';
import '../util/styles.dart';
import '../widget/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController();
  @override
  void initState() {
    super.initState();

    Get.find<OnBoardingController>().getOnBoardingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardingController>(
        builder: (onBoardingController) => onBoardingController
                .onBoardingList.isNotEmpty
            ? SafeArea(
                child: Center(
                  child: SizedBox(
                    width: Dimensions.WEB_MAX_WIDTH,
                    child: Column(
                      children: [
                        Expanded(
                            child: PageView.builder(
                          itemCount: onBoardingController.onBoardingList.length,
                          controller: _pageController,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.all(context.height * 0.05),
                                    child: Image.asset(
                                        onBoardingController
                                            .onBoardingList[index].imageUrl,
                                        height: context.height * 0.4),
                                  ),
                                  Text(
                                    onBoardingController
                                        .onBoardingList[index].title,
                                    style: robotoMedium.copyWith(
                                        fontSize: context.height * 0.022),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: context.height * 0.025),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.PADDING_SIZE_LARGE),
                                    child: Text(
                                      onBoardingController
                                          .onBoardingList[index].description,
                                      style: robotoRegular.copyWith(
                                          fontSize: context.height * 0.015,
                                          color:
                                              Theme.of(context).disabledColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]);
                          },
                          onPageChanged: (index) {
                            onBoardingController.changeSelectIndex(index);
                          },
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              _pageIndicators(onBoardingController, context),
                        ),
                        SizedBox(height: context.height * 0.05),
                        Padding(
                          padding:
                              EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          child: Row(children: [
                            onBoardingController.selectedIndex == 2
                                ? SizedBox()
                                : Expanded(
                                    child: CustomButton(
                                      transparent: true,
                                      onPressed: () {
                                        // Get.find<SplashController>()
                                        //     .disableIntro();
                                        // Get.offNamed(RouteHelper.getSignInRoute(
                                        //     RouteHelper.onBoarding));
                                      },
                                      buttonText: 'Skip',
                                    ),
                                  ),
                            Expanded(
                              child: CustomButton(
                                buttonText:
                                    onBoardingController.selectedIndex != 2
                                        ? 'Next'
                                        : 'Get Started',
                                onPressed: () {
                                  if (onBoardingController.selectedIndex != 2) {
                                    _pageController.nextPage(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.ease);
                                  } else {
                                    // Get.find<SplashController>().disableIntro();
                                    // Get.offNamed(RouteHelper.getSignInRoute(
                                    //     RouteHelper.onBoarding));
                                  }
                                },
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }

  List<Widget> _pageIndicators(
      OnBoardingController onBoardingController, BuildContext context) {
    List<Container> _indicators = [];

    for (int i = 0; i < onBoardingController.onBoardingList.length; i++) {
      _indicators.add(
        Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: i == onBoardingController.selectedIndex
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            borderRadius: i == onBoardingController.selectedIndex
                ? BorderRadius.circular(50)
                : BorderRadius.circular(25),
          ),
        ),
      );
    }
    return _indicators;
  }
}
