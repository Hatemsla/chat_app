// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
