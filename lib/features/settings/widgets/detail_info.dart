import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({
    super.key,
    required this.titleText,
    required this.listWidgets,
    required this.containerHeight,
    required this.padding,
  });

  final String titleText;
  final List<Widget> listWidgets;
  final double containerHeight;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding: padding.copyWith(top: 16),
      height: containerHeight,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
                color: theme.primaryColor, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          Expanded(
              child: Column(
            children: listWidgets,
          ))
        ],
      ),
    );
  }
}
