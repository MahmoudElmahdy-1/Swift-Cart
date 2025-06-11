import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

Future getPolyLine(currentLat, currentLong, finalLat, finalLong) async {
  List<LatLng> polyLineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polyLineSet = {};

  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$currentLat,$currentLong&destination=$finalLat,$finalLong&key=${dotenv.env['API_KEY']}";

  var response = await http.post(Uri.parse(url));

  var responsebody = jsonDecode(response.body);

  var point = responsebody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    for (var pointLatLng in result) {
      polyLineCoordinates
          .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    }
  }

  Polyline polyline = Polyline(
      points: polyLineCoordinates,
      polylineId: PolylineId('polylineId'),
      color: Colors.red,
      width: 5);

  polyLineSet.add(polyline);
  return polyLineSet;
}
