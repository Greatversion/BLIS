// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreem extends StatefulWidget {
  const MapScreem({super.key});

  @override
  State<MapScreem> createState() => _MapScreemState();
}

class _MapScreemState extends State<MapScreem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(_List);
  }

  Position? currentUser;
  Future<void> getUserLocation() async {
    try {
      currentUser = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(currentUser!.latitude);
      print(currentUser!.longitude);
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

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
  final CameraPosition _kGoogleplex =
      const CameraPosition(target: LatLng(26.876635, 81.02247), zoom: 14.456);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _kGoogleplex,
        mapType: MapType.hybrid,
      ),
    );
  }
}
