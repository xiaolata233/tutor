import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'page.dart';

String _mapStyle;
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
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId markerId1, markerId2, markerId3;
  Marker marker1, marker2, marker3;

  @override
  void initState() {
    loadImg();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  void loadImg() async {
    await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.5), 'assets/1.png')
        .then((onValue) {
      _markerIcon = onValue;
    });
    addMarker();
  }

  void addMarker(){
    _createMarker(context);
    setState(() {
      markers[markerId1] = marker1;
      markers[markerId2] = marker2;
      markers[markerId3] = marker3;
    });
  }

  void removeMarker(MarkerId id) {
    setState(() {
      if (markers.containsKey(id)) {
        markers.remove(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    _createMarkerImageFromAsset(context);
//    addMarker();
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: _kMapCenter,
        zoom: 7.0,
      ),
      markers: Set<Marker>.of(markers.values),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapToolbarEnabled: true,
      onMapCreated: _onMapCreated,
    );
  }

  void _createMarker(BuildContext context) {
    print(markers.length);
    markerId1 = MarkerId("marker_1");
      marker1 = Marker (
        markerId: markerId1,
        position: LatLng(-32.86711, 151.1947171),
        icon: _markerIcon,
        onTap: () {
//          print('1 tapped');
          removeMarker(markerId1);
        }
      );
    markerId2 = MarkerId("marker_2");
    marker2 = Marker (
        markerId: markerId2,
        position: LatLng(-32.16711, 151.1947171),
        icon: _markerIcon,
        infoWindow: InfoWindow(
          title: 'Tutor2 infor',
          snippet: 'Tutor2 is good',
          onTap: (){
            print('Tutor2 info window tapped');
          }
        ),
        onTap: (){
          print('2 tapped');
        }
    );
    markerId3 = MarkerId("marker_3");
    marker3 = Marker (
        markerId: markerId3,
        position: LatLng(-32.86711, 151.8947171),
        icon: _markerIcon,
        infoWindow: InfoWindow(
          title: 'Tutor3 infor',
          snippet: 'Tutor3 is bad',
          onTap: (){
            print('Tutor3 info window tapped');
          }
        ),
        onTap: (){
          print('3 tapped');
        }
    );
//      Marker(
//        markerId: MarkerId("marker_2"),
//        position: LatLng(-34.86711, 151.1947171),
//        icon: _markerIcon,
//        onTap: (){
//          print('2 tapped');
//        }
//      ),
//      Marker(
//        markerId: MarkerId("marker_3"),
//        position: LatLng(-33.86711, 151.9947171),
//        icon: _markerIcon,
//        onTap: (){
//          print('3 tapped');
//        }
//      ),
//    ].toSet();
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
      controller.setMapStyle(_mapStyle);
    });
  }
}