import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormRegister extends StatelessWidget {
  final String? initialValue;
  final String? keyValue;
  final String hintText;
  final String? Function(String?)? validator;
  const FormRegister(
      {super.key,
      this.initialValue,
      this.keyValue,
      required this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      /* key: _emailFieldKey, */
      name: keyValue ?? 'email',
      initialValue: initialValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      validator: validator,
      /* validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]), */
    );
  }
}
