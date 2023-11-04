import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final bool isAvailable;

  SeatWidget(this.isAvailable);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle seat selection or interaction here.
      },
      child: Container(
        width: 350,
        height: 350,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isAvailable ? Colors.green : Colors.red,
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          isAvailable ? 'Available' : 'Occupied',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
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
  ]; // Sample data

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Room with Seats'),
        ),
        body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Adjust as needed
            ),
            itemCount: seatAvailability.length,
            itemBuilder: (context, index) {
              return SeatWidget(seatAvailability[index]);
            },
          ),
        ),
      ),
    );
  }
}
