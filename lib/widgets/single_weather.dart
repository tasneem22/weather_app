import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/models/weather.dart';

class SingleWeather extends StatelessWidget {
  WeatherModel weatherModel;
  SingleWeather(this.weatherModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        weatherModel.city!,
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Text(
                      //   locationList[index].dateTime,
                      //   style: GoogleFonts.lato(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (weatherModel.temperature.toString() +
                            constants.temperatureSymbols[constants.metrics]!),
                        style: GoogleFonts.lato(
                          fontSize: 55,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            weatherModel.iconUrl!,
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            weatherModel.weatherType!,
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Next Week Forcast",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Wind',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            weatherModel.wind.toString(),
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'km/h',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: 40,
                                color: Colors.white38,
                              ),
                              Container(
                                height: 5,
                                width: weatherModel.wind / 2,
                                color: Colors.greenAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Visibility(
                      //   visible: weatherModel.rain != null,
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         'Rain',
                      //         style: GoogleFonts.lato(
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       Text(
                      //         weatherModel.rain!.toString(),
                      //         style: GoogleFonts.lato(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       Text(
                      //         'hPa',
                      //         style: GoogleFonts.lato(
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       Stack(
                      //         children: [
                      //           Container(
                      //             height: 5,
                      //             width: 40,
                      //             color: Colors.white38,
                      //           ),
                      //           Container(
                      //             height: 5,
                      //             width: weatherModel.rain! / 2,
                      //             color: Colors.redAccent,
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Column(
                        children: [
                          Text(
                            'Humidy',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            weatherModel.humidity.toString(),
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '%',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: 40,
                                color: Colors.white38,
                              ),
                              Container(
                                height: 5,
                                width: weatherModel.humidity / 2,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
