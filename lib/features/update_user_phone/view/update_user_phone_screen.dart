import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
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
  final userModel = UserPreferences.userModel!;

  @override
  void initState() {
    _newPhone.text = userModel.phoneNumber;
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
        title: Text(S.of(context).updatePhone,
            style: const TextStyle(
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
            titleText: S.of(context).setANewPhoneNumber,
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
                    hintText: S.of(context).phoneNumberRequired,
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
