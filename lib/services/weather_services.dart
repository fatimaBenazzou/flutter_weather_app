import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/forecast_modal.dart';
import '../models/weather_modal.dart';

class WeatherApiclient {
  Future<Weather>? getCurrentweather(String? location) async {
    var appid = ''; // add app id
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$appid&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
