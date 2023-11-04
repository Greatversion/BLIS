// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
                  ? Colors.black
                  : const Color.fromARGB(255, 112, 112, 112),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            isAvailable ? seatNumber : 'Full',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
