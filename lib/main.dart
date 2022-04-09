import 'package:flutter/material.dart';
import 'package:ranks_admission_test/screens/login.dart';
import 'package:ranks_admission_test/screens/weather_app.dart';
import 'package:ranks_admission_test/services/local_storage_service.dart';

late bool loadedSuccessfully;
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder<bool>(
        future: StorageService().readData(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError)
            return Scaffold(
              body: Center(
                child: Text("Error, Please try again later"),
              ),
            );
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          if (snapshot.data == false) return Login();
          return WeatherApp();
        },
      ),
    );
  }
}
