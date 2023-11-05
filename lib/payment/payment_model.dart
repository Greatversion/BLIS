import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:upi_india/upi_india.dart';

class Payment_Screen extends StatefulWidget {
  const Payment_Screen({super.key});

  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseAuth user = FirebaseAuth.instance;
User? nuser = user.currentUser;
UpiIndia _upiIndia = UpiIndia();
UpiApp app = UpiApp.googlePay;

class _Payment_ScreenState extends State<Payment_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(nuser!.photoURL.toString()),
            ),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 226, 19, 4),
        title: const Text(
          "Payment gateway",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "PAYMENT STARTED...",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          SpinKitChasingDots(
            size: 80,
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
