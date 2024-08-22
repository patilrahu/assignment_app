import 'package:assignment_app/api_service/api_service.dart';
import 'package:assignment_app/constant/url.dart';
import 'package:assignment_app/feature/home/model/home_model.dart';
import 'package:assignment_app/helper/shared_prefernce_helper.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var homeData = Rxn<HomeModel>();
  List<String> images = [];
  void getImageData() async {
    try {
      final imageData =
          await NetworkApiService().getApiResponse(ApiUrl.getImageApi);
      homeData.value = HomeModel.fromJson(imageData.data);
      images.add(homeData.value?.message ?? '');

      SharedPrefernceHelper.customSharedPreferences
          .saveValue(SharedPrefernceHelper.saveListofImage, images);
    } catch (error) {
      print(error);
    }
  }
}
