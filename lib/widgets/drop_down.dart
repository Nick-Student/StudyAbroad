import 'package:flutter/material.dart';

Widget dropDown(List<String> items, String value, void onChange(val)) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 30.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.black,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String val) {
        onChange(val);
      },
      items: items?.map<DropdownMenuItem<String>>((String val){
        return DropdownMenuItem(
          child: Text(val),
          value: val,
        );
      })?.toList() ?? [],
    ),
  );
}