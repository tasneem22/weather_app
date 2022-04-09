import 'package:flutter/material.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/services/local_storage_service.dart';
import 'package:ranks_admission_test/widgets/choose_location.dart';
import 'package:ranks_admission_test/widgets/reusable_widgets.dart';

class ManageCities extends StatefulWidget {
  VoidCallback update;
  ManageCities({Key? key, required this.update}) : super(key: key);

  @override
  _ManageCitiesState createState() => _ManageCitiesState();
}

class _ManageCitiesState extends State<ManageCities> {
  Future<void> cityChosen(String s) async {
    await StorageService()
        .addCity(s, constants.locations[s][0], constants.locations[s][1]);

    Navigator.pop(context);
    setState(() {});
    widget.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: ReusableWidgets().commonAppBar(context),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: constants.cities!.length,
                itemBuilder: (context, index) => ListTile(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  title: Text(
                    constants.cities![index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddCity(cityAdded: cityChosen)));

                  // Navigator.pop(context);
                },
                child: Icon(Icons.add),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class AddCity extends StatelessWidget {
  Future Function(String) cityAdded;
  AddCity({Key? key, required this.cityAdded}) : super(key: key);
  // String? cityName;
  // cityChosen(String s) {
  //   cityName = s;
  //   cityAdded(s);
  //   print(cityName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets().commonAppBar(context),
      backgroundColor: Colors.black87,
      body: Padding(
          padding: EdgeInsets.all(15),
          child: ChooseLocation(cityChosen: cityAdded)),
    );
  }
}
