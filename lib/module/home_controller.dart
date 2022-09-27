import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends ChangeNotifier {
  // final SignInScreenRepository repository;
  // SignInScreenController(this.repository);



  String? zipCep;


  void onZipCepChanged(String newValue) {
    zipCep = newValue;
    notifyListeners();
  }


  @override
  void dispose() {

    super.dispose();
  }

}
