import 'package:geolocator/geolocator.dart';
Position position;
void getCurrentLocation() async
{
  position= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
}
