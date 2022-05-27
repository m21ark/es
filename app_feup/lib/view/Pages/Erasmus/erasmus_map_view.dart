import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:uni/utils/constants.dart' as Constants;

import 'erasmus_uni_page_view.dart';

class ErasmusMapView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ErasmusMapViewState();
}

/// Manages the 'about' section of the app.
class ErasmusMapViewState extends GeneralPageViewState {
  // late
  GoogleMapController mapController;
  final Set<Marker> markers = Set();
  static LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  Location currentLocation = Location();
  static LatLng curLocation = const LatLng(27.7089427, 85.3086209);
  String _mapStyle;

  @override
  void initState() {
    super.initState();
    setState(() {
      getLocation();
    });
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      ErasmusDB.getUnis().forEach((element) {
        markers.add(Marker(
          //add first marker
          markerId: MarkerId(element.location.toString()),
          position: element.location, //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: element.label,
            snippet: element.course,
          ),
          onTap: () => {
            ErasmusUniversityPageViewState.university = element,
            Navigator.pushNamed(
                context, '/' + Constants.navErasmusUniversityPage)
          },
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      });
    });

    return markers;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  LatLng _center;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      body: _center == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: _onMapCreated,
              markers: getmarkers(),
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
    );
  }

  void getLocation() async {
    var loc = await currentLocation.getLocation();
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
      zoom: 12.0,
    )));
    _center = LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0);
    showLocation = LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0);
    setState(() {
      markers.add(Marker(
          markerId: MarkerId('Home'),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
    });
  }
}
