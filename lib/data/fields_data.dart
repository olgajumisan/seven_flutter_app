import 'package:flutter/material.dart';

class FieldsData {
  String validCharacters = '';
  String errorText = '';
  String incorrectText = '';
  String hintText = '';
  Function function = validateName;

  FieldsData(
      {required this.validCharacters,
      required this.hintText,
      required this.errorText,
      required this.incorrectText,
      required this.function});
}

String? validateName({String? value, FieldsData? fieldsData}) {
  if (value!.isNotEmpty) {
    if (value.length < 2)
      return fieldsData?.incorrectText;
    else
      return null;
  }
  return fieldsData?.errorText;
}

String? validateEmail({String? value, FieldsData? fieldsData}) {
  if (value!.isNotEmpty) {
    if (value.length < 6 ||
        value.endsWith('@') ||
        value.endsWith('.') ||
        (value.indexOf('@') > value.lastIndexOf('.')))
      return fieldsData?.incorrectText;
    else
      return null;
  }
  return fieldsData?.errorText;
}

Map<String, FieldsData> fieldsMap = {
  'ownerName': FieldsData(
      validCharacters: '[a-zA-ZА-Яа-я]',
      errorText: 'Пожалуйста, введите ваше имя',
      incorrectText: 'Пожалуйста, введите корректное имя',
      hintText: 'Ваше имя',
      function: validateName),
  'ownerContact': FieldsData(
      validCharacters: '[A-Za-z0-9!#%&‘*+—/=?^_`{|}~.@]',
      errorText: 'Пожалуйста, введите ваш e-mail',
      incorrectText: 'Пожалуйста, введите корректный е-мейл',
      hintText: 'Контактный E-mail',
      function: validateEmail),
  'petName': FieldsData(
      validCharacters: '[a-zA-ZА-Яа-я]',
      errorText: 'Пожалуйста, введите кличку питомца',
      incorrectText: 'Пожалуйста, введите корректную кличку',
      hintText: 'Кличка питомца',
      function: validateName),
  'petBreed': FieldsData(
      validCharacters: '[a-zA-ZА-Яа-я]',
      errorText: 'Пожалуйста, введите породу питомца',
      incorrectText: 'Пожалуйста, введите корректную породу',
      hintText: 'Порода питомца',
      function: validateName),
};
