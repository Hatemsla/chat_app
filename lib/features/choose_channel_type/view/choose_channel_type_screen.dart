import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChooseChannelTypeScreen extends StatefulWidget {
  const ChooseChannelTypeScreen({super.key});

  @override
  State<ChooseChannelTypeScreen> createState() =>
      _ChooseChannelTypeScreenState();
}

class _ChooseChannelTypeScreenState extends State<ChooseChannelTypeScreen> {
  ChannelType? _channelType = ChannelType.public;
  final TextEditingController _channelUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text('Настройки канала',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
          backgroundColor: theme.primaryColor,
        ),
        floatingActionButton: CircleFloatingActionButton(
          icon: const Icon(
            CupertinoIcons.arrow_right,
            color: Colors.white,
          ),
          onPressed: () =>
              AutoRouter.of(context).push(const AddUsersToChannelRoute()),
        ),
        body: Column(
          children: [
            DetailInfo(
              titleText: "Тип канала",
              containerHeight: 200,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              listWidgets: [
                RadioListTile<ChannelType>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: theme.primaryColor,
                  dense: true,
                  value: ChannelType.public,
                  groupValue: _channelType,
                  onChanged: (ChannelType? value) {
                    setState(() {
                      _channelType = value;
                    });
                  },
                  title: const Text(
                    'Публичный канал',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  subtitle: const Text(
                    'Публичные каналы можно найти через поиск, подписаться на них может любой пользователь',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                RadioListTile<ChannelType>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: theme.primaryColor,
                  dense: true,
                  value: ChannelType.private,
                  groupValue: _channelType,
                  onChanged: (ChannelType? value) {
                    setState(() {
                      _channelType = value;
                    });
                  },
                  title: const Text(
                    'Частный канал',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  subtitle: const Text(
                    'На частные каналы можно подписаться только по ссылке-приглашению',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (_channelType == ChannelType.public)
              Column(
                children: [
                  DetailInfo(
                    titleText: "Публичная ссылка",
                    containerHeight: 75,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    listWidgets: [
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _channelUrl,
                          style: TextStyle(
                              fontSize: theme.textTheme.bodyMedium?.fontSize,
                              color: Colors.black),
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: "cсылка",
                              prefixIcon: Text(
                                "hate.me/",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              prefixIconConstraints:
                                  BoxConstraints(minWidth: 0, minHeight: 0),
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero))),
                    ],
                  ),
                  const Card(
                    color: Colors.transparent,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text(
                        "Если у канала будет постоянная публичная ссылка, другие пользователи смогут найти его и подписаться.\n\nМожно использовать латиницу (a-z), цифры (0-9) и подчёркивание. Минимальная длина - 5 символов.",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  DetailInfo(
                    titleText: "Ссылка-приглашение",
                    containerHeight: 170,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    listWidgets: [
                      Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Text(
                              "hate.me/32ndwhqwhoo3+#32",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text(
                                    "Скопировать",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  icon: const Icon(Icons.copy),
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      iconColor: const MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(
                                          theme.primaryColor)),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text(
                                    "Поделиться",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  icon: const Icon(Icons.share),
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      iconColor: const MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(
                                          theme.primaryColor)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Card(
                    color: Colors.transparent,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text(
                        "По этой ссылке можно подписаться на канал. Вы можете сбросить ее в любой момент.",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ));
  }
}

enum ChannelType { public, private }
