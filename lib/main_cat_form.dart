import 'package:flutter/material.dart';
import 'package:seven_flutter_app/data/checkbox_data.dart';
import 'package:seven_flutter_app/data/fields_data.dart';
import 'package:seven_flutter_app/data/radio_bar_data.dart';
import 'widgets/radio_bar_widget.dart';
import 'widgets/text_field_widget.dart';
import 'widgets/check_box_widget.dart';

class MainCatForm extends StatefulWidget {
  @override
  MainCatFormState createState() => MainCatFormState();
}

class MainCatFormState extends State<MainCatForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var field in fieldsMap.entries) ...{
              SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFieldWidget(fieldsData: field.value),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            },
            RadioBarWidget(),
            for (var field in checkBoxMap.entries) ...{
              SizedBox(
                height: 35,
                child: CheckBoxWidget(data: field.value),
              )
            },
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: validateData,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                'Сохранить',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isMenuBarWidgetError() {
    for (var field in checkBoxMap.entries) {
      if (field.value.value) return false;
    }
    return true;
  }

  bool isRadioButtonBarWidgetError() {
    return radioBarData.gender == null;
  }

  void validateData() {
    if (formKey.currentState!.validate()) {
      Color color = Colors.red;
      String text = '';

      if (isRadioButtonBarWidgetError()) {
        text = RadioBarData.errorText;
      } else if (isMenuBarWidgetError()) {
        text = CheckBoxData.errorText;
      } else {
        text = 'Форма успешно заполнена!';
        color = Colors.green;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: color),
      );
    }
  }
}
