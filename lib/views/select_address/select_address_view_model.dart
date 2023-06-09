// ignore_for_file: avoid_print

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:stacked/stacked.dart';

class SelectAddressViewModel extends BaseViewModel {
  final Cities? city;
  //
  double? lat;
  double? long;
  String? address;

  Marker? marker;

  GoogleMapController? mapController;
  LatLng? initialPosition = const LatLng(31.7917, 7.0926);

  var gestureRecognizers;

  SelectAddressViewModel(this.city) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    bool res = await Helper.getLocationPermission();
    if (res) {}

    setBusy(true);
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void pickHandler() {}

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    // controller.getLatLng(screenCoordinate)
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    await _addMarker(31.7917, 7.0926);

    // setBusy(false);
    // _mapLoading = false;
  }

  _addMarker(double lat, double lng) {
    try {
      LatLng position = LatLng(lat, lng);

      marker = Marker(
        markerId: const MarkerId('marker1'),
        position: position,
        icon: BitmapDescriptor.defaultMarker,
      );

      CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: 4.9));

      mapController!.moveCamera(u2).then((void v) async {
        await _check(u2, mapController!);
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  _check(CameraUpdate u, GoogleMapController c) async {
    try {
      c.moveCamera(u);
      mapController!.moveCamera(u);
      LatLngBounds l1 = await c.getVisibleRegion();
      LatLngBounds l2 = await c.getVisibleRegion();
      notifyListeners();
      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) await _check(u, c);
    } catch (e) {
      print(e);
    }
  }

  void onCameraMove(CameraPosition position) {
    // LatLng position = LatLng(lat, lng);
    // log(position.toString());
    // marker = const Marker(
    //   markerId: MarkerId('marker1'),
    //   // position: position,
    //   position: ,
    //   icon: BitmapDescriptor.defaultMarker,
    // );
    // notifyListeners();
  }

  void onTap(LatLng argument) {
    initialPosition = LatLng(argument.latitude, argument.longitude);
    // initialPosition
    marker = Marker(
      markerId: const MarkerId('marker1'),
      position: initialPosition!,
      icon: BitmapDescriptor.defaultMarker,
    );
    CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: initialPosition!, zoom: 4.9));
    mapController!.moveCamera(u2).then((void v) async {
      await _check(u2, mapController!);
    });
    notifyListeners();
  }
}
