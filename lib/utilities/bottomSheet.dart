import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheet1 extends StatelessWidget {
  const BottomSheet1({super.key});

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return BottomSheet(
      dragHandleSize: const Size(30, 5),
      dragHandleColor: Color.fromARGB(206, 210, 210, 210),
      onClosing: () {},
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(206, 210, 210, 210),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: ListView(children: const [
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              "No Available Slots",
              style: TextStyle(fontSize: 25),
            )),
            Center(
                child: Text(
              "at the moment",
              style: TextStyle(fontSize: 25),
            )),
          ]),
        );
      },
    );
  }
}
