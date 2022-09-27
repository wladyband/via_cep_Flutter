import 'package:cep/core/color/AppColor.dart';

import 'package:cep/core/config/app_images.dart';
import 'package:cep/module/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:via_cep_flutter/via_cep_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = GetInstance().find();
  final TextEditingController textController = TextEditingController();

  Map<String, dynamic> zipCodeLocated = {
    "chave1": "valor1",
  };

  String? cepController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        title: Text("Localizador de cep"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: TextField(
                  autofocus: true,
                  controller: textController,
                  onChanged: controller.onZipCepChanged,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Digite aqui o CEP, por gentileza',
                    hintStyle: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text("Clique no ícone abaixo para obter o endereço",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 266,
                  child: ElevatedButton(
                    child: Image.asset(AppImages.cep),
                    onPressed: () async {
                      zipCodeLocated =
                          await readAddressByCep(controller.zipCep!);

                      if(zipCodeLocated.isEmpty){

                          Get.snackbar(
                            'CEP inválido',
                            '',
                            colorText: Colors.blueGrey,
                            margin: EdgeInsets.only(top: 220),
                            forwardAnimationCurve: Curves.easeOutBack,
                          );

                      }

                      if (zipCodeLocated.isEmpty) return;

                      print(" valor ${zipCodeLocated}");

                      setState(() {
                        textController.text = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: AppColors.yellow,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ListView.separated(
                        itemCount: zipCodeLocated.length,
                        itemBuilder: ((_, i) {
                          final key = zipCodeLocated.keys.elementAt(i);
                          return zipCodeLocated[key]! == 'valor1'
                              ? Column(
                                  children: [],
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(zipCodeLocated[key]!),
                                    ),
                                  ],
                                );
                        }),
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
