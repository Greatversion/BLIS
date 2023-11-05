// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatWidget extends StatelessWidget {
  final bool isAvailable;
  String seatNumber;

  SeatWidget(
    this.isAvailable,
    this.seatNumber,
  ) : super();

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        // Handle seat selection or interaction here.
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          // width: responsive.size.width,
          // height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isAvailable
                  ? Colors.green
                  // : const Color.fromARGB(255, 112, 112, 112),
                  : const Color.fromARGB(255, 237, 16, 0),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            isAvailable ? seatNumber : 'Full',
            style: GoogleFonts.kanit(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarTab extends StatelessWidget {
  const TabBarTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> seatAvailability = [
      true,
      false,
      true,
      true,
      false,
      true,
      false,
      true,
      true,
      false,
      true,
      true,
      false,
      true,
      false,
      true,
      true,
      false,
      true
    ];
    var responsive = MediaQuery.of(context);
    return Container(
      height: responsive.size.height * 0.5,
      width: responsive.size.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Adjust as needed
        ),
        itemCount: seatAvailability.length,
        itemBuilder: (context, index) {
          return SeatWidget(seatAvailability[index], (index + 1).toString());
        },
      ),
    );
  }
}
