import 'package:flutter/material.dart';

class MyTextFormWidget extends StatelessWidget {
  const MyTextFormWidget({
    Key? key,
    required this.str,
    required this.name,
  }) : super(key: key);

  final ValueChanged<String> str;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter your $name',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else {
          str(value);
          print(value);
        }
        return null;
      },
    );
  }
}
