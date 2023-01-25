import 'package:flutter/material.dart';

class CheckBoxData {
  bool value = false;
  String title = '';

  static String errorText = 'Пожалуйста, выберите тип корма!';

  CheckBoxData({
    required this.title,
    required this.value,
  });
}

var checkBoxMap = {
  'dryFood': CheckBoxData(title: 'Сухой корм', value: false),
  'wetFood': CheckBoxData(title: 'Влажный корм', value: false),
  'naturalFood': CheckBoxData(title: 'Натуральный корм', value: false),
};
