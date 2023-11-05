import 'package:bhago_bharat/screens/seat_matrix.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sized_box_for_whitespace
            Stack(alignment: Alignment.bottomLeft, children: [
              Container(
                height: 250,
                width: responsive.size.width,
                child: Swiper(
                  itemCount: 5,
                  pagination:
                      const SwiperPagination(builder: SwiperPagination.rect),
                  control: const SwiperControl(size: 30, color: Colors.white),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      "assets/demo.jpg",
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 25.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Central Library",
                        style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " 4 ⭐",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ]),
            Container(
              width: responsive.size.width,
              height: responsive.size.height * 0.45,
              child: ContainedTabBarView(
                tabBarProperties: const TabBarProperties(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color.fromARGB(255, 161, 160, 160)),
                tabs: const [
                  Text('First'),
                  Text('Second'),
                  Text('Third'),
                  Text('Fouth'),
                  Text('Fifth'),
                  Text('Sixth'),
                ],
                views: const [
                  TabBarTab(),
                  TabBarTab(),
                  TabBarTab(),
                  TabBarTab(),
                  TabBarTab(),
                  TabBarTab(),
                ],
                onChange: (index) => print(index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                "Features",
                style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free Wifi",
                          style: TextStyle(fontSize: 15.5, color: Colors.white),
                        ),
                        Text(
                          "Personal Desk",
                          style: TextStyle(fontSize: 15.5, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "24/7 Open",
                          style: TextStyle(fontSize: 15.5, color: Colors.white),
                        ),
                        Text(
                          "A/C Room",
                          style: TextStyle(fontSize: 15.5, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 226, 19, 4)),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              " ₹200",
                              style: GoogleFonts.kanit(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " + including all taxes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                        Text(
                          "Book Your Spot",
                          style: GoogleFonts.kanit(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
