
import 'package:cep/module/home_bindings.dart';
import 'package:cep/module/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),

  ];
}

class Routes {
  static const home = '/home';
}
