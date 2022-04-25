import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/forecast_modal.dart';
import '../models/weather_modal.dart';

class WeatherApiclient {
  Future<Weather>? getCurrentweather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=71db1fcc5077323d3d17be58446caa63&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
