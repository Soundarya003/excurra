import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:dropdown_plus_plus/dropdown_plus_plus.dart';

class CreateDropDown extends StatefulWidget {
  @override
  late String dropdownvalue;
  late Function(String? newValue)? onChanged;

  CreateDropDown({required this.dropdownvalue, required this.onChanged});

  @override
  State<CreateDropDown> createState() => _CreateDropDownState();
}

class _CreateDropDownState extends State<CreateDropDown> {
  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: countryFieldDecoration(),
          padding: EdgeInsets.only(left: 20, top: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextDropdownFormField(
                  options: ["Male", "Female","Female","Female","Female","Female","Female","Female","Female"],
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                ),
                DropdownFormField<Map<String, dynamic>>(
                  onEmptyActionPressed: (String str) async {},
                  dropdownItemSeparator: Divider(
                    color: Colors.black,
                    height: 1,
                  ),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                  onSaved: (dynamic str) {},
                  onChanged: (dynamic str) {},
                  validator: null,
                  displayItemFn: (dynamic item) => Text(
                    (item ?? {})['name'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  findFn: (dynamic str) async => _roles,
                  selectedFn: (dynamic item1, dynamic item2) {
                    if (item1 != null && item2 != null) {
                      return item1['name'] == item2['name'];
                    }
                    return false;
                  },
                  filterFn: (dynamic item, str) =>
                  item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
                  dropdownItemFn: (dynamic item, int position, bool focused,
                      bool selected, Function() onTap) =>
                      ListTile(
                        title: Text(item['name']),
                        subtitle: Text(
                          item['desc'] ?? '',
                        ),
                        tileColor:
                        focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                        onTap: onTap,
                      ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
