
import 'package:get/get.dart';
import 'package:captain/Utils/rout_utils.dart';

class SplashController extends GetxController{


  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() async{

    Future.delayed(const Duration(seconds: 5) , (){
      Get.offAllNamed(NameRouts.home);
    });
  }

}