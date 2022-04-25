import '../constantes.dart';
import '../globals.dart' as globals;
import 'package:flutter/material.dart';

import '../models/weather_modal.dart';
import '../services/weather_services.dart';
import '../widgets/extra_info.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  WeatherApiclient client = WeatherApiclient();
  Weather? data;

  Future<void> getData(c) async {
    data = await client.getCurrentweather(c);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: beige,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: globals.favoriteCities.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                elevation: 5,
                color: Colors.white,
                child: FutureBuilder(
                    future: getData(globals.favoriteCities[index]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //1ere partie => weather infos + icon
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //weather infos
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      //temperature
                                      Text('${data!.temp?.round()}°',
                                          style: const TextStyle(
                                              color: mauve,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)),

                                      SizedBox(
                                        height: h * 0.01,
                                      ),

                                      //city
                                      Text('${data!.cityName}',
                                          style: const TextStyle(
                                              color: mauve,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),

                                      SizedBox(
                                        height: h * 0.01,
                                      ),

                                      //country
                                      Text('${data!.country}',
                                          style: const TextStyle(
                                              color: lilas,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  )),

                                  //weather icon
                                  Expanded(
                                    child: Image.asset(
                                      'assets/icons/${data?.icon}.png',
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //weather extra infos
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //extra info 1
                                  ExtraInfo(
                                      icon: Icons.water_drop_outlined,
                                      text: '${data!.humidity}%'),

                                  //extra info 2
                                  ExtraInfo(
                                      icon: Icons.schedule,
                                      text: '${data!.pressure}bar'),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: orange),
                        );
                      }
                      return Container();
                    }),
              );
            }),
      ),
    );
  }
}
