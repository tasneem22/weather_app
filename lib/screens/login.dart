import 'package:flutter/material.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/screens/weather_app.dart';
import 'package:ranks_admission_test/services/local_storage_service.dart';
import 'package:ranks_admission_test/widgets/choose_location.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  String? cityName;
  Future cityChosen(String s) async {
    cityName = s;
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose a City",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: ChooseLocation(cityChosen: cityChosen)),
              OutlinedButton(
                child: Text(
                  "Login",
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.white),
                ),
                onPressed: () {
                  if (cityName == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Please Choose a city",
                      style: TextStyle(color: Colors.red),
                    )));
                  } else {
                    StorageService().addCity(
                        cityName!,
                        constants.locations[cityName][0],
                        constants.locations[cityName][1]);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherApp()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
