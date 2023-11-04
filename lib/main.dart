import 'package:bhago_bharat/screens/homeScreen.dart';
import 'package:bhago_bharat/screens/hotelScreen.dart';
import 'package:bhago_bharat/screens/seat_matrix.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocationPermission permission = await Geolocator.requestPermission();
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
      home: MyApps(),
      routes: {
        "hotelScreen": (context) => const HotelScreen(),
        // "mainScreen": (context) => const MainScreen(),
        // "homePage": (context) => const HomePage(),
        // // "share": (context) => SharePage(),
        // "map": (context) => const UserMap(),
        // "leaderBoard": (context) => const LeaderBoard(),j
      },
    );
  }
}
