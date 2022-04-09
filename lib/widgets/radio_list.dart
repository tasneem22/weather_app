import 'package:flutter/material.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/services/local_storage_service.dart';

import 'reusable_widgets.dart';

class RadioListBuilder extends StatefulWidget {
  List list;
  int initialPosition;
  VoidCallback callback;
  VoidCallback update;
  String type;
  RadioListBuilder(
      {Key? key,
      required this.list,
      required this.initialPosition,
      required this.callback,
      required this.update,
      required this.type})
      : super(key: key);

  @override
  RadioListBuilderState createState() {
    return RadioListBuilderState();
  }
}

class RadioListBuilderState extends State<RadioListBuilder> {
  int value = 0;
  @override
  void initState() {
    // TODO: implement initState
    value = widget.initialPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: ReusableWidgets().commonAppBar(context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey, disabledColor: Colors.grey),
            child: RadioListTile(
              activeColor: Colors.white,
              value: index,
              groupValue: value,
              onChanged: (int? ind) {
                if (widget.type == 'lang') {
                  constants.language = constants.languages.keys.elementAt(ind!);
                  print(constants.language);
                  StorageService().changeLanguage();
                } else {
                  constants.metrics =
                      constants.unitsLabels.keys.elementAt(ind!);
                  StorageService().changeUnit();
                }
                widget.callback();
                setState(() {
                  value = ind;
                  Navigator.pop(context);
                  widget.update();
                });
              },
              title: Text(
                widget.list[index],
                style: TextStyle(
                    color: index == value ? Colors.white : Colors.grey),
              ),
            ),
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}
