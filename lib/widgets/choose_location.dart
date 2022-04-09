import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;

class ChooseLocation extends StatelessWidget {
  ChooseLocation({Key? key, required this.cityChosen}) : super(key: key);
  TextEditingController controller = TextEditingController();
  Future Function(String) cityChosen;
  @override
  Widget build(BuildContext context) {
    return TypeAhead(
      onSuggestionSelection: (suggestion) async {
        controller.text = (suggestion as Map)['city'];

        await cityChosen((suggestion as Map)['city']);
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'This field is required';
        }
      },
      itemBuilder: (context, suggestion) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Text((suggestion! as Map)['city']),
        );
      },
      suggestionsCallback: (pattern) async {
        return getSuggestion(pattern);
      },
      title: '',
      controller: controller,
      afterSpace: true,
      hintValue: 'Choose a city',
    );
  }
}

class TypeAhead extends StatelessWidget {
  TypeAhead({
    Key? key,
    required this.title,
    required this.controller,
    required this.afterSpace,
    required this.hintValue,
    required this.suggestionsCallback,
    required this.onSuggestionSelection,
    this.validator,
    required this.itemBuilder,
  }) : super(key: key);
  String title, hintValue;
  bool afterSpace;
  TextEditingController controller;
  String? Function(String?)? validator;
  FutureOr<Iterable<Object?>> Function(String) suggestionsCallback;
  void Function(Object?) onSuggestionSelection;
  Widget Function(BuildContext, Object?) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Avenir LT Pro',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D0C23),
          ),
        ),
      ),
      TypeAheadFormField(
        keepSuggestionsOnLoading: false,
        textFieldConfiguration: TextFieldConfiguration(
          style: TextStyle(color: Colors.white),
          controller: this.controller,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEFEFEF)),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEFEFEF)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEFEFEF)),
            ),
            hintText: 'Choose a city',
            hintStyle: TextStyle(
              fontFamily: 'Avenir LT Pro',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF717171),
            ),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEFEFEF))),
          ),
        ),
        suggestionsCallback: suggestionsCallback,
        itemBuilder: itemBuilder,
        onSuggestionSelected: onSuggestionSelection,
        validator: validator,
        // onSaved: (value) => this._selectedCity = value,
      ),
      afterSpace
          ? const SizedBox(
              height: 20,
            )
          : Container(),
    ]);
  }
}

List<Map<String, dynamic>> getSuggestion(String pattern) {
  return constants.cityLocation
      .where((map) =>
          (map['city'] as String)
              .toLowerCase()
              .contains(pattern.toLowerCase()) &&
          (constants.cities == null ||
              constants.cities!.contains(map['city'] as String) == false))
      .toList();
}
