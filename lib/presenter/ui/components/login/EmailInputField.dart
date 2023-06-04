import 'package:flutter/material.dart';
import '../form/TextFormFieldComponent.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextFormFieldInputComponent(
      hintText: "Email",
      prefixIcon: Icons.email,
    );
  }
}
