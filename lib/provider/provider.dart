
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class DataProvider extends ChangeNotifier{
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
    notifyListeners();
 
  }


  
}