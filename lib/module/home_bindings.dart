
import 'package:cep/module/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {



    //Get.lazyPut(() => SignInScreenRepository(Get.find<Dio>()));
    Get.lazyPut(() => HomeController());

  }
}
