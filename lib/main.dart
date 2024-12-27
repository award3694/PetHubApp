// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet_hub/services/mongodb.dart';
// import 'package:pet_hub/splash%20screen/splash_screen.dart';
// import 'package:pet_hub/utils/colors.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await MongoDatabase.connection();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final List<String> funFacts = [
//     "Dogs' sense of smell is 10,000 to 100,000 times better than humans!",
//     "The Basenji dog doesn't bark — it yodels.",
//     "Puppies are born deaf and gain hearing after about 3 weeks.",
//     "Dogs dream similarly to humans and often twitch during REM sleep.",
//     "A dog's nose print is as unique as a human fingerprint.",
//     "Greyhounds can run at speeds of up to 45 miles per hour!",
//     "Dogs have three eyelids, including a third eyelid for eye protection.",
//     "Some dogs can understand up to 250 words and gestures.",
//     "Chow Chows and Shar Peis have blue-black tongues.",
//     "Dogs can smell emotions like fear, happiness, and sadness."
//   ];

//   int currentFactIndex = 0;
//   late Timer timer;

//   @override
//   void initState() {
//     super.initState();
//     // Start a timer to show a snack bar every 10 minutes (600 seconds).
//     timer = Timer.periodic(const Duration(minutes: 10), (Timer t) {
//       _showFunFact();
//     });
//   }

//   @override
//   void dispose() {
//     timer.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//   }

//   void _showFunFact() {
//     Get.snackbar(
//       "Did You Know?", // Title
//       funFacts[currentFactIndex], // Message
//       snackPosition: SnackPosition.TOP,
//       duration: const Duration(seconds: 8),
//       backgroundColor: orange,
//       colorText: white,
//       icon: const Icon(
//         Icons.pets,
//         color: white,
//       ),
//     );

//     // Move to the next fact, looping back to the start if necessary
//     setState(() {
//       currentFactIndex = (currentFactIndex + 1) % funFacts.length;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: orange),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_hub/services/mongodb.dart';
import 'package:pet_hub/splash%20screen/splash_screen.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:provider/provider.dart';

import 'provider/login_provider.dart';
import 'provider/reg_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> funFacts = [
    "Dogs' sense of smell is 10,000 to 100,000 times better than humans!",
    "The Basenji dog doesn't bark — it yodels.",
    "Puppies are born deaf and gain hearing after about 3 weeks.",
    "Dogs dream similarly to humans and often twitch during REM sleep.",
    "A dog's nose print is as unique as a human fingerprint.",
    "Greyhounds can run at speeds of up to 45 miles per hour!",
    "Dogs have three eyelids, including a third eyelid for eye protection.",
    "Some dogs can understand up to 250 words and gestures.",
    "Chow Chows and Shar Peis have blue-black tongues.",
    "Dogs can smell emotions like fear, happiness, and sadness."
  ];

  int currentFactIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Start a timer to show a snack bar every 10 minutes (600 seconds).
    timer = Timer.periodic(const Duration(minutes: 10), (Timer t) {
      _showFunFact();
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _showFunFact() {
    Get.snackbar(
      "Did You Know?", // Title
      funFacts[currentFactIndex], // Message
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 8),
      backgroundColor: orange,
      colorText: white,
      icon: const Icon(
        Icons.pets,
        color: white,
      ),
    );

    // Move to the next fact, looping back to the start if necessary
    setState(() {
      currentFactIndex = (currentFactIndex + 1) % funFacts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: orange),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
