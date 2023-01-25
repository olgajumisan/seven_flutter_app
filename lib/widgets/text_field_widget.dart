import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/fields_data.dart';

class TextFieldWidget extends StatefulWidget {
  FieldsData fieldsData;

  TextFieldWidget({required this.fieldsData});

  @override
  _TextFieldWidgetState createState() =>
      _TextFieldWidgetState(fieldsData: fieldsData);
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FieldsData fieldsData;

  final _text = TextEditingController();

  _TextFieldWidgetState({required this.fieldsData});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _text,
      cursorColor: Colors.green,
      inputFormatters: [
        if (fieldsData.validCharacters.isNotEmpty) ...{
          FilteringTextInputFormatter.allow(
            RegExp(fieldsData.validCharacters),
          ),
        }
      ],
      validator: (value) =>
          fieldsData.function(value: value, fieldsData: fieldsData),
      //validator: validateName(value, fieldsData),
      decoration: InputDecoration(
        fillColor: Colors.white10,
        focusColor: Colors.green,
        hoverColor: Colors.green,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintText: fieldsData.hintText,
        hintStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        //errorText: fieldsData.function(_text.text, fieldsData),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
