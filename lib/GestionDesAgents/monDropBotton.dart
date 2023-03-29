import 'package:flutter/material.dart';

List<String> list = <String>['Marier', 'Divorcer', 'Célibataire', 'Veuf/Veuve'];

class MonDropdownButton extends StatefulWidget {
  MonDropdownButton({
    super.key,
  });

  @override
  State<MonDropdownButton> createState() => _MonDropdownButtonState();
}

class _MonDropdownButtonState extends State<MonDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButton<String>(
        //dropdownColor: Colors.amber,

        //decoration: InputDecoration(hintText: "Etat-Civil"),
        value: dropdownValue,
        icon: Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: const Icon(
            Icons.arrow_drop_down,
            color: Colors.orange,
          ),
        ),

        style: const TextStyle(color: Colors.black),
        /* underline: Container(
          height: 2,
          color: Colors.orange,
        ) */
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text("  $value"),
          );
        }).toList(),
      ),
    );
  }
}
