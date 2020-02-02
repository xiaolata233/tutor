import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'page.dart';

var HEIGHT = 7.0, WIDTH = 7.0;
class MarkerIconsPage extends Page {
  MarkerIconsPage() : super(const Icon(Icons.image), 'Marker icons');

  @override
  Widget build(BuildContext context) {
    return const MarkerIconsBody();
  }
}

class MarkerIconsBody extends StatefulWidget {
  const MarkerIconsBody();

  @override
  State<StatefulWidget> createState() => MarkerIconsBodyState();
}

const LatLng _kMapCenter = LatLng(-33.86711, 151.1947171);

class MarkerIconsBodyState extends State<MarkerIconsBody> {
  GoogleMapController controller;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.5), 'assets/1.png')
        .then((onValue) {
      _markerIcon = onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
//    _createMarkerImageFromAsset(context);
    return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _kMapCenter,
                zoom: 7.0,
              ),
              markers: _createMarker(context),
              onMapCreated: _onMapCreated,
            );
  }

  Set<Marker> _createMarker(BuildContext context) {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(-32.86711, 151.1947171),
        icon: _markerIcon,
        onTap: (){
          print('1 tapped');
        }
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(-34.86711, 151.1947171),
        icon: _markerIcon,
        onTap: (){
          print('2 tapped');
        }
      ),
      Marker(
        markerId: MarkerId("marker_3"),
        position: LatLng(-33.86711, 151.9947171),
        icon: _markerIcon,
        onTap: (){
          print('3 tapped');
        }
      ),
    ].toSet();
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(context, );
      BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'assets/yifan.jpg')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
    });
  }
}