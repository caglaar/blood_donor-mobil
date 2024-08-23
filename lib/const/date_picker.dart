import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DatePickerField extends StatelessWidget {
  final String name;
  final String hintText;
  final DateTime initialDate;
  final FormFieldValidator<String>? validator;

  const DatePickerField({
    Key? key,
    required this.name,
    required this.hintText,
    required this.initialDate,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: validator,
      builder: (FormFieldState<String?> field) {
        return GestureDetector(
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              field.didChange(pickedDate.toString().split(' ')[0]); // Save only the date part
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: hintText,
              labelStyle: const TextStyle(color: Colors.black), // Optional: Change label color
              errorText: field.errorText,
              filled: true,
              fillColor: Colors.white, // White background
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              prefixIcon: const Icon(Icons.calendar_today, color: Colors.grey), // Icon
            ),
            child: Text(
              field.value ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
