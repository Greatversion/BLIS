import 'package:bhago_bharat/screens/seat_matrix.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
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
  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 250,
              width: responsive.size.width,
              child: Swiper(
                itemCount: 5,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                itemBuilder: (context, index) {
                  return Image.asset(
                    "assets/demo.jpg",
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: responsive.size.height * 0.5,
                width: responsive.size.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // Adjust as needed
                  ),
                  itemCount: seatAvailability.length,
                  itemBuilder: (context, index) {
                    return SeatWidget(
                        seatAvailability[index], index.toString());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
