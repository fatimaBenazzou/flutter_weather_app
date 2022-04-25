
import 'package:flutter/material.dart';
import 'package:mc_weather_app/constantes.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({
    Key? key,
    required this.forecastData,
  }) : super(key: key);

  final List forecastData;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: forecastData.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: w,
              height: 50,

              child: Row(
                children: [

                  // day
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.only(left: w * 0.1),
                        child: Text('${forecastData[index].date}',style: const TextStyle(color: mauve,fontSize: 20,fontWeight: FontWeight.w400),)
                    ),
                  ),

                  //weather icon
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        child: Image.asset(
                            'assets/icons/${forecastData[index].icon}.png'),height: 48,width: 48),
                  ),

                  // max + min temperature
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                            '${forecastData[index].maxTemp.round()}°',style: const TextStyle(color: mauve,fontSize: 20,fontWeight: FontWeight.w400)),Text(
                            ' ${forecastData[index].minTemp.round()}°',style: const TextStyle(color: lilas,fontSize: 20,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
