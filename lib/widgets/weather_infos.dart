
import 'package:flutter/material.dart';

import '../constantes.dart';
import '../models/weather_modal.dart';

class WeatherInfos extends StatelessWidget {
  const WeatherInfos({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Weather? data;


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //city
            Text('${data!.cityName}',
                style: const TextStyle(
                    color: mauve,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),

            SizedBox(
              height: h * 0.01,
            ),

            //temperature
            Text('${data!.temp?.round()}°',
                style: const TextStyle(
                    color: mauve,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),

            SizedBox(
              height: h * 0.01,
            ),

            //weather
            Container(
                padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                decoration: BoxDecoration(
                  color: lilas,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text('${data!.weather}',
                    style: const TextStyle(
                        color: mauve,
                        fontSize: 20,
                        fontWeight: FontWeight.w400))
            ),
          ],
        ));
  }
}
