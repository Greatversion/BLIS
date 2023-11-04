import 'dart:async';

import 'package:bhago_bharat/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Marker> _markers = [];
  final List<Marker> _List = const [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(26.876635, 81.02247),
        infoWindow: InfoWindow(title: "My location")),
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(26.876794238557377, 81.02782944304226),
        infoWindow: InfoWindow(title: "My School")),
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(26.875823585477352, 81.02373912373632),
        infoWindow: InfoWindow(title: "My Buisness")),
  ];
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final CameraPosition _kGoogleplex = const CameraPosition(
      target: LatLng(28.73735816963204, 77.11958309475176), zoom: 14.88);
  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 49, 87),
        title: const Text("Hi Learner", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                // getUserLocation;
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       CupertinoIcons.book_solid,
        //       color: Colors.white,
        //     )),
      ),
      drawer: Drawer(
        
      ),
      // ignore: sized_box_for_whitespace
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearest Study Rooms",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: responsive.size.height * 0.3,
                      child: (ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "hotelScreen");
                              },
                              child: Card(
                                color: const Color.fromARGB(206, 210, 210, 210),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(30, 30))),
                                child: Column(
                                  children: [
                                    Expanded(
                                      // ignore: sized_box_for_whitespace
                                      child: Container(
                                          height: responsive.size.height * 0.3,
                                          child:
                                              Image.asset("assets/demo.jpg")),
                                    ),
                                    const Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Central Library",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 25),
                                          Text("Rating : ⭐⭐⭐⭐")
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.location_on),
                                          Text("Lucknow , India")
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Text("09:00-12:00")
                                    ]),
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                  const SizedBox(
                      height:
                          15), //////LIne Breakk...........................................
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Available Slots",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text("View all"))
                    ],
                  ),
                  Container(
                    height: responsive.size.height * 0.2,
                    child: (ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Card(
                            color: const Color.fromARGB(123, 255, 251, 251),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(20, 20))),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Central Library"),
                                          Row(
                                            children: [
                                              Text("Lucknow , India"),
                                              Icon(Icons.location_on),
                                            ],
                                          )
                                        ]),
                                  ),
                                  Container(
                                      height: 60,
                                      width: responsive.size.width * 0.3,
                                      color:
                                          const Color.fromARGB(255, 4, 49, 87),
                                      child: const Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              "AVAILABLE",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            "--",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                  Container(
                    height: responsive.size.height * 0.2,
                    child: GoogleMap(
                      myLocationEnabled: true,
                      markers: Set<Marker>.of(_markers),
                      onMapCreated: (controller) {
                        _controller.complete(controller);
                      },
                      initialCameraPosition: _kGoogleplex,
                      mapType: MapType.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
