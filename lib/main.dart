import 'package:bhago_bharat/Authentication/login.dart';
import 'package:bhago_bharat/Authentication/loginPage.dart';
import 'package:bhago_bharat/payment/payment_model.dart';
import 'package:bhago_bharat/screens/homeScreen.dart';
import 'package:bhago_bharat/screens/hotelScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocationPermission permission = await Geolocator.requestPermission();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        iconButtonTheme: const IconButtonThemeData(
            style:
                ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
        useMaterial3: true,
      ),
      home: LoginCheck(),
      routes: {
        "libScreen": (context) => const HotelScreen(),
        "homeScreen": (context) => const HomeScreen(),
        "loginScreen": (context) => const SignInScreen(),
        "paymentScreen": (context) => Payment_Screen(),
        // "mainScreen": (context) => const MainScreen(),
        // "homePage": (context) => const HomePage(),
        // // "share": (context) => SharePage(),
        // "map": (context) => const UserMap(),
        // "leaderBoard": (context) => const LeaderBoard(),j
      },
    );
  }
}
