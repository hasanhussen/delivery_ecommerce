import 'package:ecommercedelivery/bindings/intialbindings.dart';
import 'package:ecommercedelivery/core/localization/changelocal.dart';
import 'package:ecommercedelivery/core/localization/translation.dart';
import 'package:ecommercedelivery/core/services/services.dart';
import 'package:ecommercedelivery/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'ecommercedelivery Course',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
