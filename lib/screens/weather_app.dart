import 'package:flutter/material.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/screens/manage_cities.dart';
import 'package:ranks_admission_test/screens/settings.dart';
import 'package:ranks_admission_test/services/rest_api_service.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../models/weather.dart';
import '../widgets/buildin_transform.dart';
import '../widgets/single_weather.dart';
import '../widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  // late String bgImg;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    constants.streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    WeatherApiService().fetchCitiesWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (locationList[_currentPage].weatherType == 'Sunny') {
    //   bgImg = 'assets/sunny.jpg';
    // } else if (locationList[_currentPage].weatherType == 'Night') {
    //   bgImg = 'assets/night.jpg';
    // } else if (locationList[_currentPage].weatherType == 'Rainy') {
    //   bgImg = 'assets/rainy.jpg';
    // } else if (locationList[_currentPage].weatherType == 'Cloudy') {
    //   bgImg = 'assets/cloudy.jpeg';
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManageCities(
                          update: update,
                        )));
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Settings(
                            update: update,
                          )));
            },
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder<List<WeatherModel>>(
            stream: constants.streamController.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SafeArea(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              List<WeatherModel> cities = snapshot.data!;

              return Stack(
                children: [
                  Image.asset(
                    cities[_currentPage].image!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black38),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 15),
                    child: Row(
                      children: [
                        for (int i = 0; i < cities.length; i++)
                          if (i == _currentPage)
                            SliderDot(true)
                          else
                            SliderDot(false)
                      ],
                    ),
                  ),
                  TransformerPageView(
                    scrollDirection: Axis.horizontal,
                    transformer: ScaleAndFadeTransformer(),
                    viewportFraction: 0.8,
                    onPageChanged: _onPageChanged,
                    itemCount: cities.length,
                    itemBuilder: (ctx, i) => SingleWeather(cities[i]),
                  ),
                ],
              );
            }),
      ),
    );
  }

  update() {
    _currentPage = 0;
    WeatherApiService().fetchCitiesWeather();
    setState(() {});
  }
}
