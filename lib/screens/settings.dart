import 'package:flutter/material.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/widgets/radio_list.dart';
import 'package:ranks_admission_test/widgets/settings_list_tile.dart';

import '../widgets/reusable_widgets.dart';

class Settings extends StatefulWidget {
  VoidCallback update;
  Settings({Key? key, required this.update}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: ReusableWidgets().commonAppBar(context),
      body: ListView(
        shrinkWrap: true,
        children: [
          settingsTile(
            title: "Units",
            chosenValue: constants.unitsLabels[constants.metrics]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RadioListBuilder(
                      type: 'units',
                      callback: widget.update,
                      update: update,
                      initialPosition: constants.unitsLabels.keys
                          .toList()
                          .indexOf(constants.metrics),
                      list: constants.unitsLabels.entries
                          .map((e) => e.value)
                          .toList()),
                ),
              );
            },
          ),
          settingsTile(
            title: "Language",
            chosenValue: constants.languages[constants.language]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RadioListBuilder(
                      type: 'lang',
                      callback: widget.update,
                      update: update,
                      initialPosition: constants.language == 'en' ? 0 : 1,
                      list: constants.languages.entries
                          .map((e) => e.value)
                          .toList()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  update() {
    setState(() {});
  }
}
