import 'package:floward_project/binding/home_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/app_routes.dart';
import 'config/translation.dart';
import 'config/user_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late String language = UserSecureStorage.VALUE_EN_LANGUAGE;

  Future<void> getLanguage() async {
    language = await UserSecureStorage.getLanguage();
    Get.updateLocale(Locale(language));
  }

  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBindings(),
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.transparent,
        primaryColor: Colors.white,
        primaryIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.white.withAlpha(1)),
      ),
      locale: Locale(language),
      fallbackLocale: Locale(language),
      initialRoute: AppRoutes.listOfUser,
      getPages: AppRoutes.routes,
      translations: Translation(),
    );
  }
}
