import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CreateDropDown extends StatelessWidget {
  final String dropdownValue;
  final Function(String?)? onChanged;

  CreateDropDown({required this.dropdownValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: countryFieldDecoration(),
        padding: EdgeInsets.only(left: 20, top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownSearch<String>(
                items: ["Male", "Female", "Other"],
                selectedItem: dropdownValue,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
