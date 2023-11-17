import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  const FormTextField(
      {super.key,
      this.hint,
      this.label,
      this.type,
      this.controller,
      this.validator});

  final String? hint;
  final Text? label;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      keyboardType: widget.type,
      controller: widget.controller,
      validator: widget.validator,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
          hintText: widget.hint, label: widget.label, border: InputBorder.none),
      obscureText: widget.type == null,
    );
  }
}
