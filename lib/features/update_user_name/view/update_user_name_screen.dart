import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UpdateUserNameScreen extends StatefulWidget {
  const UpdateUserNameScreen({super.key});

  @override
  State<UpdateUserNameScreen> createState() => _UpdateUserNameScreenState();
}

class _UpdateUserNameScreenState extends State<UpdateUserNameScreen> {
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
        title: const Text("Изменить имя",
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
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    focusNode: _newNameFocus,
                    keyboardType: TextInputType.text,
                    controller: _newName,
                    style: TextStyle(
                        fontSize: theme.textTheme.bodyMedium?.fontSize,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Имя",
                        hintStyle: const TextStyle(
                            color: Colors.black38, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.zero),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: theme.primaryColor, width: 2),
                            borderRadius: BorderRadius.zero)),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
