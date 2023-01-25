import 'package:flutter/material.dart';
import 'package:seven_flutter_app/data/radio_bar_data.dart';
import '../data/radio_bar_data.dart';

class RadioBarWidget extends StatefulWidget {
  @override
  RadioBarWidgetState createState() => RadioBarWidgetState();
}

class RadioBarWidgetState extends State<RadioBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
              contentPadding: EdgeInsets.all(0),
              value: Gender.male,
              activeColor: Colors.green,
              groupValue: radioBarData.gender,
              title: const Text('Самец'),
              onChanged: (Gender? value) {
                setState(() {
                  radioBarData.set(value);
                });
              }),
        ),
        Expanded(
          child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: Colors.green,
              value: Gender.female,
              groupValue: radioBarData.gender,
              title: const Text('Самка'),
              onChanged: (Gender? value) {
                setState(() {
                  radioBarData.set(value);
                });
              }),
        ),
      ],
    );
  }
}
