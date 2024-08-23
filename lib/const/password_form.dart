import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordField extends StatelessWidget {
  final String name;
  final String hintText;
  final FormFieldValidator<String>? validator;

  const PasswordField({
    Key? key,
    required this.name,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: validator,
      builder: (FormFieldState<String?> field) {
        return TextField(
          onChanged: (value) {
            field.didChange(value);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: hintText,
            errorText: field.errorText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          obscureText: true,
        );
      },
    );
  }
}
