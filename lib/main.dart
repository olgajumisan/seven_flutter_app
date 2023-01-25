import 'package:flutter/material.dart';
import 'main_cat_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Center(
            child: Text('Анкета для человеков'),
          ),
        ),
        body: MainCatForm(),
      ),
    );
  }
}
