import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UpdateUserEmailScreen extends StatefulWidget {
  const UpdateUserEmailScreen({super.key});

  @override
  State<UpdateUserEmailScreen> createState() => _UpdateUserEmailScreenState();
}

class _UpdateUserEmailScreenState extends State<UpdateUserEmailScreen> {
  final TextEditingController _newName = TextEditingController();
  final FocusNode _newNameFocus = FocusNode();

  @override
  void initState() {
    _newName.text = "kalashnikovjan@yandex.ru";
    _newNameFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _newName.dispose();
    _newNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        surfaceTintColor: Colors.transparent,
        title: const Text("Почта",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
              onPressed: () => AutoRouter.of(context).pop(),
              icon: const Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          DetailInfo(
            titleText: "Задать почту пользователя",
            containerHeight: 90,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            listWidgets: [
              TextFormField(
                focusNode: _newNameFocus,
                keyboardType: TextInputType.text,
                controller: _newName,
                style: TextStyle(
                    fontSize: theme.textTheme.bodyMedium?.fontSize,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Почта(обязательно)",
                    hintStyle:
                        const TextStyle(color: Colors.black38, fontSize: 14),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.zero),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 2),
                        borderRadius: BorderRadius.zero)),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 12),
            child: const Card(
              color: Colors.black12,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  "После выбора новой почты, вам придет сообщение на новую почту с подтверждением.",
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
