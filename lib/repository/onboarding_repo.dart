import 'package:get/get.dart';

import '../model/onboarding_model.dart';
import '../util/images.dart';

class OnBoardingRepo {
  Response getOnBoardingList() {
    try {
      List<OnBoardingModel> onBoardingList = [
        OnBoardingModel(Images.onboard_1, "Get Favorite Items",
            "Select your location to see the wide range stores and order your desired item."),
        OnBoardingModel(Images.onboard_2, "Easy Payment",
            "Order item with COD payment or pay by safer and faster payment gateway."),
        OnBoardingModel(Images.onboard_3, "Fast Delivery",
            "Hundreds of delivery man are waiting for your order. So place your order and get the item delivered to your doorstep!"),
      ];

      Response response = Response(body: onBoardingList, statusCode: 200);
      return response;
    } catch (e) {
      return Response(statusCode: 404, statusText: 'Onboarding data not found');
    }
  }
}
