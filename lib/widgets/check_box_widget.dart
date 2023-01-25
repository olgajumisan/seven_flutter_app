import 'package:flutter/material.dart';
import '../data/checkbox_data.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxData data;

  CheckBoxWidget({required this.data});

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState(data: data);
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  CheckBoxData data;
  _CheckBoxWidgetState({required this.data});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: Colors.green,
        title: Text(
          data.title,
          style: TextStyle(fontSize: 16),
        ),
        value: data.value,
        contentPadding: EdgeInsets.all(0),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: ((bool? value) => setState(() => data.value = value!)));
  }
}
