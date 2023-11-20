import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
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
          title: Text(S.of(context).channelSettings,
              style: const TextStyle(
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
              titleText: S.of(context).channelType,
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
                  title: Text(
                    S.of(context).publicChannel,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  subtitle: Text(
                    S.of(context).publicChannelDescription,
                    style: const TextStyle(fontWeight: FontWeight.normal),
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
                  title: Text(
                    S.of(context).privateChannel,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  subtitle: Text(
                    S.of(context).privateChannelDescription,
                    style: const TextStyle(fontWeight: FontWeight.normal),
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
                    titleText: S.of(context).publicLink,
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
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: S.of(context).link,
                              prefixIcon: const Text(
                                "hate.me/",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 0, minHeight: 0),
                              hintStyle: const TextStyle(
                                  color: Colors.black38, fontSize: 14),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero))),
                    ],
                  ),
                  Card(
                    color: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Text(
                        S.of(context).privateLinkExtended,
                        style: const TextStyle(
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
                    titleText: S.of(context).invitationLink,
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
                                  label: Text(
                                    S.of(context).copy,
                                    style: const TextStyle(
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
                                  label: Text(
                                    S.of(context).share,
                                    style: const TextStyle(
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
                  Card(
                    color: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Text(
                        S.of(context).publicLinkExtended,
                        style: const TextStyle(
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
