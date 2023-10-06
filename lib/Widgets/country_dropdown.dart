import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class CreateDropDown extends StatelessWidget{
  @override
  late String dropdownvalue;
  late  Function(String? newValue)? onChanged;
  CreateDropDown({required this.dropdownvalue, required this.onChanged});

  Widget build(BuildContext context) {
       return  Expanded(
         child: Container(
           padding: EdgeInsets.only(left: 10.0),
           decoration: countryFieldDecoration(),
           child: DropdownButton(
             dropdownColor: Colors.white,
             value: dropdownvalue,
             onChanged: onChanged,
             items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                 .map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value),
               );
             }).toList(),
             style: TextStyle(
               color: Colors.black, // Text color
               fontSize: 15.0, // Text font size
             ),
             underline: SizedBox(), // Remove the default underline
           ),
         ),
       );
}}