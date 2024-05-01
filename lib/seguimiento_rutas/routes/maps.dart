import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  LatLng destinationLocation = LatLng(-0.1988909, -78.4830105);
  LatLng originLocation = LatLng(0, 0);
  Location currentPosition = Location();
  bool initialPositionGotten = false;

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  List<LatLng> polylineCoordinates = [];

  PolylinePoints polylinePoints = PolylinePoints();
  List<PolylinePoints> polylinePointsList = [];

  String googleAPiKey = "AIzaSyA_39uYPO0tEpGMasM2j8y-a2DXPuDj6tc";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _listenToLocationChanges() {
    Location location = new Location();
    LatLng lastPosition = originLocation;
    LatLng destination = destinationLocation;

    location.onLocationChanged.listen((LocationData currentLocation) {
      double distanceInMeters = Geolocator.distanceBetween(
          lastPosition.latitude,
          lastPosition.longitude,
          currentLocation.latitude!,
          currentLocation.longitude!);

      if (distanceInMeters > 3) {
        setState(() {
          lastPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _updateMarkersAndPolyline(lastPosition);
        });
      }

      // Verificación de distancia al destino
      double distanceToDestination = Geolocator.distanceBetween(
          currentLocation.latitude!,
          currentLocation.longitude!,
          destination.latitude,
          destination.longitude);
      if (distanceToDestination < 50) {
        print("Distancia al destino: $distanceToDestination");
        // Supongamos que "X" es 500 metros
        _showCongratulationsDialog();
      }
    });
  }

  void _updateMarkersAndPolyline(LatLng newPosition) {
    MarkerId originId = MarkerId("origin");
    Marker originMarker = Marker(
      markerId: originId,
      icon: BitmapDescriptor.defaultMarker,
      position: newPosition,
    );

    markers[originId] = originMarker;
    _getPolyline();
  }

  void _showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¡Felicidades!"),
          content: Text("Has llegado a menos de 500 metros de tu destino."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }

  // void _listenToLocationChanges() {
  //   Location location = Location();
  //   LatLng lastPosition = originLocation;
  //   location.onLocationChanged.listen((LocationData currentLocation) {
  //     double distanceInMeters = Geolocator.distanceBetween(
  //         lastPosition.latitude,
  //         lastPosition.longitude,
  //         currentLocation.latitude!,
  //         currentLocation.longitude!);

  //     if (distanceInMeters > 3) {
  //       setState(() {
  //         originLocation =
  //             LatLng(currentLocation.latitude!, currentLocation.longitude!);
  //         _updateMarkersAndPolyline();
  //       });
  //     }
  //   });
  // }

  // void _updateMarkersAndPolyline() {
  //   setState(() {
  //     MarkerId originId = MarkerId("origin");
  //     Marker originMarker = Marker(
  //       markerId: originId,
  //       icon: BitmapDescriptor.defaultMarker,
  //       position: originLocation,
  //     );

  //     markers[originId] = originMarker;
  //     MarkerId destinationId = MarkerId("destination");
  //     Marker destinationMarker = Marker(
  //       markerId: destinationId,
  //       icon: BitmapDescriptor.defaultMarkerWithHue(90),
  //       position: destinationLocation,
  //     );

  //     markers[destinationId] = destinationMarker;

  //     _getPolyline();
  //   });
  // }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _addMarker(LatLng(position.latitude, position.longitude), "origin",
          BitmapDescriptor.defaultMarker);
      originLocation = LatLng(position.latitude, position.longitude);

      initialPositionGotten = true;

      _addMarker(destinationLocation, "destination",
          BitmapDescriptor.defaultMarkerWithHue(90));
      _getPolyline();
      _listenToLocationChanges();
    });
  }

  void _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  void _getPolyline() async {
    print(
        'originLocation: $originLocation, destinationLocation: $destinationLocation');
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(originLocation.latitude, originLocation.longitude), // origem
      PointLatLng(destinationLocation.latitude,
          destinationLocation.longitude), // destino
      travelMode: TravelMode.walking,
    );

    polylineCoordinates.clear();

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 3,
      );
      setState(() {
        polylines[id] = polyline;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: originLocation,
                zoom: 16,
              ),
            ),
          );
        },
        child: const Icon(Icons.center_focus_strong),
      ),
      body: SafeArea(
          child: initialPositionGotten
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: originLocation,
                    zoom: 14,
                  ),
                  zoomControlsEnabled: false,
                  markers: Set<Marker>.of(markers.values),
                  polylines: Set<Polyline>.of(polylines.values),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
