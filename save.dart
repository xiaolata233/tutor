import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'page.dart';
import 'map.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

BitmapDescriptor _markerIcon;

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(32.881069, -117.237670);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Tutor Near Me')),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _createMarker(),
//          myLocationEnabled: true,
//          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
        ),
      ),
    );
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(32.881069, -117.237670),
//        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(33.881069, -117.237670),
//        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_3"),
        position: LatLng(30.881069, -115.237670),
//        icon: _markerIcon,
      ),
    ].toSet();
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'yifan.jpg')
          .then(_updateBitmap);
    }
  }
}