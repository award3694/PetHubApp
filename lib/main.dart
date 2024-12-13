import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_hub/splash%20screen/splash_screen.dart';
import 'package:pet_hub/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: orange),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
