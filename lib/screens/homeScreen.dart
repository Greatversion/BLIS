import 'dart:async';

// import 'package:bhago_bharat/provider/provider.dart';
import 'package:bhago_bharat/Authentication/loginPage.dart';
import 'package:bhago_bharat/utilities/bottomSheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';

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
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googlesigin = GoogleSignIn();
  Future<void> signOutGoogle() async {
    const Center(child: CircularProgressIndicator());
    await auth.signOut();
    await googlesigin.signOut();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final CameraPosition _kGoogleplex = const CameraPosition(
      target: LatLng(28.73735816963204, 77.11958309475176), zoom: 14.88);
  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 4, 49, 87),
        backgroundColor: const Color.fromARGB(255, 217, 21, 7),
        title: const Text("Hii Learner",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text(
                          "Do you want to Log out ?",
                          style: TextStyle(fontSize: 20),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                auth.signOut();
                                Navigator.popAndPushNamed(
                                    context, 'loginScreen');
                              },
                              child: const Text(
                                "Log out",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ))
                        ],
                      ),
                    );
                  });
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        width: responsive.size.width * 0.68,
        backgroundColor: Colors.black,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 42.0),
                child: Text(
                  "About App :",
                  style: GoogleFonts.alice(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 14.0),
                child: Text.rich(TextSpan(
                  text: 'BLIS ,',
                  style: GoogleFonts.alice(
                      color: Colors.red,
                      fontWeight: FontWeight.w100,
                      fontSize: 22),
                  children: [
                    TextSpan(
                      text:
                          "  the study room booking app is a user-friendly platform designed to help students find and reserve study spaces efficiently. It offers a seamless experience for both students and room owners. Students can search for available study rooms, filter their options, and book them for specific time slots. The app includes geolocation services to find nearby study spaces and allows users to communicate with room owners. With user-friendly interfaces, security features, and a robust tech stack, it ensures a convenient and secure study room booking experience.",
                      style: GoogleFonts.alice(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 18),
                    )
                  ],
                )),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "_____________",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Study Rooms",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                                  Navigator.pushNamed(context, "libScreen");
                                },
                                child: Card(
                                  color:
                                      const Color.fromARGB(206, 210, 210, 210),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(30, 30))),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        // ignore: sized_box_for_whitespace
                                        child: Container(
                                            height:
                                                responsive.size.height * 0.3,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return const BottomSheet1();
                                  });
                            },
                            child: const Text("View all"))
                      ],
                    ),
                    Container(
                      height: responsive.size.height * 0.2,
                      child: (ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color.fromARGB(206, 210, 210, 210),
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
                                            Text(
                                              "Central Library",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Lucknow , India",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(Icons.location_on),
                                              ],
                                            )
                                          ]),
                                    ),
                                    Container(
                                        height: 60,
                                        width: responsive.size.width * 0.3,
                                        color: const Color.fromARGB(
                                            255, 4, 49, 87),
                                        child: const Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                "AVAILABLE",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nearest Study Rooms 📍",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(206, 210, 210, 210),
                      ),
                      height: responsive.size.height * 0.20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: GoogleMap(
                          myLocationEnabled: true,
                          markers: Set<Marker>.of(_markers),
                          onMapCreated: (controller) {
                            _controller.complete(controller);
                          },
                          initialCameraPosition: _kGoogleplex,
                          mapType: MapType.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
