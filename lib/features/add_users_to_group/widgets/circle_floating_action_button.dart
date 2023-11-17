import 'package:flutter/material.dart';

class CircleFloatingActionButton extends StatelessWidget {
  const CircleFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: theme.primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: icon,
    );
  }
}
