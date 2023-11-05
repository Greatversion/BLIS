import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginCheck extends StatefulWidget {
  const LoginCheck({super.key});

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> checkCurrentUser(BuildContext context) async {
    final User? googleUser = _auth.currentUser;
    if (googleUser != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, "homeScreen");
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, "loginScreen");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkCurrentUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return SizedBox(
      height: responsive.size.height,
      width: responsive.size.width,
      child: Opacity(
        opacity: 0.3,
        child: Image.asset(
          "assets/splash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
