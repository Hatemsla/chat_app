import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UpdateGroupInfoScreen extends StatefulWidget {
  const UpdateGroupInfoScreen({super.key});

  @override
  State<UpdateGroupInfoScreen> createState() => _UpdateGroupInfoScreenState();
}

class _UpdateGroupInfoScreenState extends State<UpdateGroupInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        surfaceTintColor: theme.primaryColor,
        title: const Text(
          "Изменить",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () => AutoRouter.of(context).pop(),
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Column(children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 70,
                width: 70,
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Имя группы",
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 2)),
                        focusColor: theme.primaryColor,
                        isDense: true,
                        suffixIconConstraints: const BoxConstraints(
                            minWidth: 2, minHeight: 32, maxHeight: 100),
                        suffixIcon: InkWell(
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            size: 26,
                          ),
                          onTap: () {},
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 22, top: 18),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    maxLength: 600,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Описание",
                      contentPadding: const EdgeInsets.only(bottom: 4),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: theme.primaryColor, width: 2)),
                      focusColor: theme.primaryColor,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
