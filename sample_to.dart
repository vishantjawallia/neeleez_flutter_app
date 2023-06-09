// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoder;

import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:location/location.dart' as location;

// import '../locations.dart' as;

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _mapLoading = true;
  bool isLoading = true;
  final bool _autoLoc = false;

  Timer? _timerDummy;

  GoogleMapController? _controller;

  String _address = '';
  String _stateName = '';
  bool? autoLoactionVisible;
  bool? load = false;

  double _lat = 0.0;
  double _long = 0.0;

  final LatLng _initialPosition = const LatLng(28.7041, 77.1025);
  Marker? _marker;
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _pincode = TextEditingController();

  final loc.Location location = loc.Location();
  bool? serviceEnabled;
  loc.PermissionStatus? permissionGranted;
  loc.LocationData? locationData;
  @override
  void initState() {
    super.initState();
    // final auth = Provider.of<AuthProvider>(context, listen: false);
    // if (auth.user!.longitude == null) {
    //   getLocation();
    // } else {
    //   setState(() {
    //     _lat = double.parse(auth.user!.latitude!);
    //     _long = double.parse(auth.user!.longitude!);
    //     _state.text = auth.user!.state!;
    //     _city.text = auth.user!.city!;
    //     _pincode.text = auth.user!.pincode!;
    //   });
    // }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future getLocation() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        log("ll");
        return;
      } else {
        log("ww");
      }
    } else {
      log("message");
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        log("qq");
        return;
      } else {
        log("ww");
      }
    } else {
      log("zz");
    }
    locationData = await location.getLocation();
    if (locationData != null) {
      try {
        await _getAddress(locationData!.latitude!, locationData!.longitude!);
      } catch (e) {
        log(e.toString());
      }
    } else {
      log(locationData.toString());
      return;
    }
  }

  Future<void> _getAddress(lat, long) async {
    await geocoder.placemarkFromCoordinates(lat, long).then((placemarks) {
      Map<String, dynamic> output;
      if (placemarks.isNotEmpty) {
        output = placemarks[0].toJson();
        log(output.toString());
        setState(() {
          _address = output['subLocality'] + ', ' + output['administrativeArea'] + ', ' + output['postalCode'] + ', ' + output['country'];
          _stateName = output['administrativeArea'];
          _lat = lat;
          _long = long;
          _state.text = output['administrativeArea'];
          _city.text = output['subLocality'];
          _pincode.text = output['postalCode'];
        });
        _addMarker(lat, long);
      }
    });
  }

  _addMarker(double lat, double lng) {
    try {
      LatLng position = LatLng(lat, lng);

      _marker = Marker(
        markerId: const MarkerId('marker1'),
        position: position,
        icon: BitmapDescriptor.defaultMarker,
      );

      CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: 4.9));

      _controller!.moveCamera(u2).then((void v) async {
        await _check(u2, _controller!);
      });
    } catch (e) {
      print(e);
    }
  }

  _check(CameraUpdate u, GoogleMapController c) async {
    try {
      c.moveCamera(u);
      _controller!.moveCamera(u);
      LatLngBounds l1 = await c.getVisibleRegion();
      LatLngBounds l2 = await c.getVisibleRegion();

      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) await _check(u, c);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildGoogleMap(),
        ],
      ),
    );
  }

  /* --------------- // build google maps to used inside widget --------------- */
  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      trafficEnabled: false,
      compassEnabled: true,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: false,
      tiltGesturesEnabled: true,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      markers: Set.of((_marker != null) ? [_marker!] : []),
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) async {
        _controller = controller;
        await _addMarker(28.7041, 77.1025);
        _mapLoading = false;
      },
      onTap: (position) {},
    );
  }
}
