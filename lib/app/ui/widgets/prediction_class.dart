import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:job_helper/app/services/api_keys.dart';
import 'package:job_helper/app/services/gpsLocation.dart';

import '../my_home_page.dart';

// a class to get the prediction at use input while using google autocomplete places search
class PredictionClass{

  getPrediction(context) async {
    // request permission of user
    GPSLocation().requestLocationPermission();
    GPSLocation(). gpsService(context);
    // the prediction method to enable google places autocomplete
    Prediction p = await PlacesAutocomplete.show(
        radius: 10000000,
        context: context,
        apiKey: APIKeys.googlePlacesApi,
        mode: Mode.overlay,
        language: "en"
      //components: [Component(Component.country, 'uk')]
    );
    // display the prediction and retrieve the data in the search field
    displayPrediction(p, MyHomePage().createState().getHomePageScaffold.currentState);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    // inisilize google maps places with the api key provided by google
    GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: APIKeys.googlePlacesApi);
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);
      // retrieve the place the user wants alongside the lat and long
      var placeId = p.placeId;
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      print(lat);
      print(lng);
      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }
}