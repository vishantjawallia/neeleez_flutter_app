import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';



class DraggableMapApp extends StatelessWidget {
  const DraggableMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DraggableMapScreen(),
    );
  }
}

class DraggableMapScreen extends StatefulWidget {
  const DraggableMapScreen({super.key});

  @override
  _DraggableMapScreenState createState() => _DraggableMapScreenState();
}

class _DraggableMapScreenState extends State<DraggableMapScreen> {
  final LatLng _initialPosition = const LatLng(37.422, -122.084); // Default initial position
  LatLng? _selectedPosition; // Selected/dragged position

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: _selectedPosition != null
            ? {
                Marker(
                  markerId: const MarkerId('selectedPosition'),
                  position: _selectedPosition!,
                ),
              }
            : {},
        onMapCreated: (GoogleMapController controller) {},
        onCameraMove: (CameraPosition position) {
          setState(() {
            _selectedPosition = null; // Reset the selected position when camera moves
          });
        },
        onCameraIdle: () {
          // When the camera stops moving, update the selected position
          setState(() {
            _selectedPosition = _selectedPosition ?? _initialPosition;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.my_location),
        onPressed: () {
          // Center the map on the current user location
          // You can implement location functionality using packages like 'geolocator'
        },
      ),
    );
  }
}
