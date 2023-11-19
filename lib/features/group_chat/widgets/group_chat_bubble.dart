// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GroupChatBubble extends StatelessWidget {
  const GroupChatBubble({
    super.key,
    required this.message,
    required this.leftSide,
  });

  final String message;
  final bool leftSide;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: (leftSide)
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16))
              : const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
          color: theme.primaryColor.withOpacity(0.7)),
      child: Text(
        message,
        style: TextStyle(
            fontSize: theme.textTheme.bodyMedium?.fontSize,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      ),
    );
  }
}
