import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UpdateUserPhoneScreen extends StatefulWidget {
  const UpdateUserPhoneScreen({super.key});

  @override
  State<UpdateUserPhoneScreen> createState() => _UpdateUserPhoneScreenState();
}

class _UpdateUserPhoneScreenState extends State<UpdateUserPhoneScreen> {
  final TextEditingController _newPhone = TextEditingController();
  final FocusNode _newNameFocus = FocusNode();

  @override
  void initState() {
    _newPhone.text = "+7 (965) 582-08-60";
    _newNameFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _newPhone.dispose();
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
        title: const Text("Изменить телефон",
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
            titleText: "Задать новый телефон",
            containerHeight: 90,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            listWidgets: [
              TextFormField(
                focusNode: _newNameFocus,
                keyboardType: TextInputType.text,
                controller: _newPhone,
                style: TextStyle(
                    fontSize: theme.textTheme.bodyMedium?.fontSize,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Телефон(обязательно)",
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
        ],
      ),
    );
  }
}