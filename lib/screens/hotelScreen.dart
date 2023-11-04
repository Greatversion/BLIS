import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
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
            )
          ],
        ),
      ),
    );
  }
}
