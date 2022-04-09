import 'package:flutter/material.dart';

class ReusableWidgets {
  commonAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
