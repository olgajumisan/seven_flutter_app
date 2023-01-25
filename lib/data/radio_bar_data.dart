import 'package:flutter/material.dart';

enum Gender { male, female }

class RadioBarData {
  Gender? _gender;

  Gender? get gender => _gender;

  static String errorText = 'Пожалуйста, выберите пол питомца!';

  void set(value) => _gender = value;
}

var radioBarData = RadioBarData();
