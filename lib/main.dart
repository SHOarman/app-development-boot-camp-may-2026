import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/dependencyinjection/injecation.dart';
import 'core/route/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.bindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MExpensive',
      initialRoute: AppPages.initial,
      getPages:AppPages.routes,
    );
  }
}