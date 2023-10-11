import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class CreateDropDown extends StatefulWidget {
  @override
  late String dropdownvalue;
  late Function(String? newValue)? onChanged;

  CreateDropDown({required this.dropdownvalue, required this.onChanged});

  @override
  State<CreateDropDown> createState() => _CreateDropDownState();
}

class _CreateDropDownState extends State<CreateDropDown> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 15.0),
        decoration: countryFieldDecoration(),
        child: DropDownTextField(
          clearOption: false,
          textFieldFocusNode: textFieldFocusNode,
          searchFocusNode: searchFocusNode,
          // searchAutofocus: true,
          dropDownItemCount: 8,
          searchShowCursor: false,
          enableSearch: true,
          searchKeyboardType: TextInputType.text,
          dropDownList: const [
            DropDownValueModel(name: 'name1', value: "value1"),
            DropDownValueModel(
                name: 'name2',
                value: "value2",
                toolTipMsg:
                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
            DropDownValueModel(name: 'name3', value: "value3"),
            DropDownValueModel(
                name: 'name4',
                value: "value4",
                toolTipMsg:
                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
            DropDownValueModel(name: 'name5', value: "value5"),
            DropDownValueModel(name: 'name6', value: "value6"),
            DropDownValueModel(name: 'name7', value: "value7"),
            DropDownValueModel(name: 'name8', value: "value8"),
          ],
          onChanged: (val) {

          },
        ),
      ),
    );
  }
}
