import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
