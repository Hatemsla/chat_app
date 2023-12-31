import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class UpdateUserDescriptionScreen extends StatefulWidget {
  const UpdateUserDescriptionScreen({super.key});

  @override
  State<UpdateUserDescriptionScreen> createState() =>
      _UpdateUserDescriptionScreenState();
}

class _UpdateUserDescriptionScreenState
    extends State<UpdateUserDescriptionScreen> {
  final TextEditingController _newDescription = TextEditingController();
  final FocusNode _newNameFocus = FocusNode();

  @override
  void initState() {
    _newDescription.text = "Level up!";
    _newNameFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _newDescription.dispose();
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
        title: Text(S.of(context).aboutMe,
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
            titleText: S.of(context).personalInformation,
            containerHeight: 110,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            listWidgets: [
              TextFormField(
                maxLength: 80,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                focusNode: _newNameFocus,
                keyboardType: TextInputType.text,
                controller: _newDescription,
                style: TextStyle(
                    fontSize: theme.textTheme.bodyMedium?.fontSize,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: S.of(context).aboutMe,
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
            alignment: Alignment.centerLeft,
            child: Card(
              color: Colors.white,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Text(
                  S.of(context).youCanAddAFewLinesAboutYourself,
                  style: const TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
