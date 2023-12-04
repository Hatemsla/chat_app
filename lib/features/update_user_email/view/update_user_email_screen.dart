import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
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
  final userModel = UserPreferences.userModel!;

  @override
  void initState() {
    _newName.text = userModel.email;
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
        title: Text(S.of(context).email,
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
            titleText: S.of(context).setTheUserEmail,
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
                    hintText: S.of(context).mailRequired,
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
            child: Card(
              color: Colors.black12,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  S.of(context).afterSelectingANewMail,
                  style: const TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
