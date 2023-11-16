import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CityDropdown extends StatefulWidget {
  final List cityData;
  final ValueChanged<String> onCitySelected;
  final String? selectedCity;

  const CityDropdown({
    Key? key,
    required this.cityData,
    required this.onCitySelected,
    required this.selectedCity,
  }) : super(key: key);

  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          ),
          controller: TextEditingController(text: widget.selectedCity),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        suggestionsCallback: (pattern) async {
          return widget.cityData
              .where((city) =>
              city['city'].toLowerCase().contains(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, suggestion) {
          return Container(
            color: Colors.grey[200],
            child: ListTile(
              title: Text(
                '${suggestion['city']}',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        },
        onSuggestionSelected: (suggestion) {
          String selectedCity = '${suggestion['city']}';
          setState(() {
            widget.onCitySelected(selectedCity);
          });
        },
        noItemsFoundBuilder: (context) {
          return Container(
            color: Colors.grey[200],
            child: ListTile(
              title: Text(
                'Please select a city',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          );
        },
        onSaved: (value) {
          widget.onCitySelected(value!);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a city';
          }
          return null;
        },
      ),
    );
  }
}