import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Language? _language = Language.English;

  @override
  void didChangeDependencies() {
    _language = _getCurrentLanguage();
    super.didChangeDependencies();
  }

  Language _getCurrentLanguage() {
    Locale currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode.startsWith('ru')) {
      return Language.Russian;
    } else {
      return Language.English;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userModel = UserPreferences.userModel!;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              userModel.displayName ?? userModel.email,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              S.of(context).online,
              style: const TextStyle(color: Colors.white70),
            )),
        backgroundColor: theme.primaryColor,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        onTap: () => AutoRouter.of(context)
                            .push(const UpdateUserNameRoute()),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.edit_outlined,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).updateName,
                                style: const TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            S.of(context).choosePhoto,
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )),
                    PopupMenuItem(
                        onTap: () =>
                            AutoRouter.of(context).replace(const SignInRoute()),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.exit_to_app_outlined,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).exit,
                                style: const TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ))
                  ]),
        ],
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(children: [
        DetailInfo(
          titleText: S.of(context).account,
          containerHeight: 205,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
          listWidgets: [
            ListTile(
              onTap: () =>
                  AutoRouter.of(context).push(const UpdateUserPhoneRoute()),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                userModel.phoneNumber,
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                S.of(context).clickToChangeThePhoneNumber,
                style: const TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () =>
                  AutoRouter.of(context).push(const UpdateUserEmailRoute()),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                userModel.email,
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                S.of(context).clickToChangeTheMail,
                style: const TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () => AutoRouter.of(context)
                  .push(const UpdateUserDescriptionRoute()),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                userModel.about ?? "",
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                S.of(context).aboutMe,
                style: const TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
          height: 120,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).languageSettings,
                style: TextStyle(
                    color: theme.primaryColor, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Русский",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Radio<Language>(
                      value: Language.Russian,
                      activeColor: theme.primaryColor,
                      groupValue: _language,
                      onChanged: (val) {
                        setState(() {
                          _language = val;
                          S.load(const Locale('ru'));
                        });
                      },
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "English",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Radio<Language>(
                      value: Language.English,
                      activeColor: theme.primaryColor,
                      groupValue: _language,
                      onChanged: (val) {
                        setState(() {
                          _language = val;
                          S.load(const Locale('en'));
                        });
                      },
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ]),
    );
  }
}

enum Language { Russian, English }
