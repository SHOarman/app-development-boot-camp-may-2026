import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/dependencyinjection/injecation.dart';
import 'core/route/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.bindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MotorBridge',
      initialRoute: AppPages.initial,
      getPages:AppPages.routes,
    );
  }
}