import 'package:flutter/material.dart';

class settingsTile extends StatelessWidget {
  String chosenValue, title;
  void Function() onTap;
  settingsTile({
    Key? key,
    required this.title,
    required this.chosenValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            this.chosenValue,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
