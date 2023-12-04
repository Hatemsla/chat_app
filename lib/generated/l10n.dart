// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in now`
  String get logInNow {
    return Intl.message(
      'Log in now',
      name: 'logInNow',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct Phone`
  String get enterCorrectPhone {
    return Intl.message(
      'Enter correct Phone',
      name: 'enterCorrectPhone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct Email`
  String get enterCorrectEmail {
    return Intl.message(
      'Enter correct Email',
      name: 'enterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Min 6 symbols`
  String get min6Symbols {
    return Intl.message(
      'Min 6 symbols',
      name: 'min6Symbols',
      desc: '',
      args: [],
    );
  }

  /// `Passwords not equal`
  String get passwordsNotEqual {
    return Intl.message(
      'Passwords not equal',
      name: 'passwordsNotEqual',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Language settings`
  String get languageSettings {
    return Intl.message(
      'Language settings',
      name: 'languageSettings',
      desc: '',
      args: [],
    );
  }

  /// `online`
  String get online {
    return Intl.message(
      'online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Update name`
  String get updateName {
    return Intl.message(
      'Update name',
      name: 'updateName',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo`
  String get choosePhoto {
    return Intl.message(
      'Choose photo',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Click to change the phone number`
  String get clickToChangeThePhoneNumber {
    return Intl.message(
      'Click to change the phone number',
      name: 'clickToChangeThePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Click to change the mail`
  String get clickToChangeTheMail {
    return Intl.message(
      'Click to change the mail',
      name: 'clickToChangeTheMail',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get aboutMe {
    return Intl.message(
      'About me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Set the user's email`
  String get setTheUserEmail {
    return Intl.message(
      'Set the user\'s email',
      name: 'setTheUserEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mail(required)`
  String get mailRequired {
    return Intl.message(
      'Mail(required)',
      name: 'mailRequired',
      desc: '',
      args: [],
    );
  }

  /// `After selecting a new mail, you will receive a confirmation message to the new mail.`
  String get afterSelectingANewMail {
    return Intl.message(
      'After selecting a new mail, you will receive a confirmation message to the new mail.',
      name: 'afterSelectingANewMail',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personalInformation {
    return Intl.message(
      'Personal information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `You can add a few lines about yourself.`
  String get youCanAddAFewLinesAboutYourself {
    return Intl.message(
      'You can add a few lines about yourself.',
      name: 'youCanAddAFewLinesAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong...`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong...',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Create a group`
  String get createGroup {
    return Intl.message(
      'Create a group',
      name: 'createGroup',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get Chats {
    return Intl.message(
      'Chats',
      name: 'Chats',
      desc: '',
      args: [],
    );
  }

  /// `Update phone`
  String get updatePhone {
    return Intl.message(
      'Update phone',
      name: 'updatePhone',
      desc: '',
      args: [],
    );
  }

  /// `Set a new phone number`
  String get setANewPhoneNumber {
    return Intl.message(
      'Set a new phone number',
      name: 'setANewPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number(required)`
  String get phoneNumberRequired {
    return Intl.message(
      'Phone number(required)',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Group name`
  String get groupName {
    return Intl.message(
      'Group name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get notAMember {
    return Intl.message(
      'Not a member?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `{n} participants`
  String nParticipants(Object n) {
    return Intl.message(
      '$n participants',
      name: 'nParticipants',
      desc: '',
      args: [n],
    );
  }

  /// `Search for participants`
  String get searchForParticipants {
    return Intl.message(
      'Search for participants',
      name: 'searchForParticipants',
      desc: '',
      args: [],
    );
  }

  /// `Leave the group`
  String get leaveTheGroup {
    return Intl.message(
      'Leave the group',
      name: 'leaveTheGroup',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Description of the group`
  String get groupDescription {
    return Intl.message(
      'Description of the group',
      name: 'groupDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get enabled {
    return Intl.message(
      'Enabled',
      name: 'enabled',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get disabled {
    return Intl.message(
      'Disabled',
      name: 'disabled',
      desc: '',
      args: [],
    );
  }

  /// `Add participants`
  String get addParticipants {
    return Intl.message(
      'Add participants',
      name: 'addParticipants',
      desc: '',
      args: [],
    );
  }

  /// `was online at {time}`
  String wasOnlineAtTime(Object time) {
    return Intl.message(
      'was online at $time',
      name: 'wasOnlineAtTime',
      desc: '',
      args: [time],
    );
  }

  /// `The text is copied to the clipboard.`
  String get theTextIsCopiedToTheClipboard {
    return Intl.message(
      'The text is copied to the clipboard.',
      name: 'theTextIsCopiedToTheClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Chat name`
  String get chatName {
    return Intl.message(
      'Chat name',
      name: 'chatName',
      desc: '',
      args: [],
    );
  }

  /// `{participants_count} participants`
  String participantsCountOfParticipants(Object participants_count) {
    return Intl.message(
      '$participants_count participants',
      name: 'participantsCountOfParticipants',
      desc: '',
      args: [participants_count],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Clear History`
  String get clearHistory {
    return Intl.message(
      'Clear History',
      name: 'clearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Disable notifications`
  String get disableNotifications {
    return Intl.message(
      'Disable notifications',
      name: 'disableNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Leave the group`
  String get exitGroup {
    return Intl.message(
      'Leave the group',
      name: 'exitGroup',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the group`
  String get enterTheNameOfTheGroup {
    return Intl.message(
      'Enter the name of the group',
      name: 'enterTheNameOfTheGroup',
      desc: '',
      args: [],
    );
  }

  /// `Create a channel`
  String get createChannel {
    return Intl.message(
      'Create a channel',
      name: 'createChannel',
      desc: '',
      args: [],
    );
  }

  /// `Channel Name`
  String get channelName {
    return Intl.message(
      'Channel Name',
      name: 'channelName',
      desc: '',
      args: [],
    );
  }

  /// `Sorting by login time`
  String get sortingByLoginTime {
    return Intl.message(
      'Sorting by login time',
      name: 'sortingByLoginTime',
      desc: '',
      args: [],
    );
  }

  /// `was recently`
  String get wasRecently {
    return Intl.message(
      'was recently',
      name: 'wasRecently',
      desc: '',
      args: [],
    );
  }

  /// `Channel settings`
  String get channelSettings {
    return Intl.message(
      'Channel settings',
      name: 'channelSettings',
      desc: '',
      args: [],
    );
  }

  /// `Channel type`
  String get channelType {
    return Intl.message(
      'Channel type',
      name: 'channelType',
      desc: '',
      args: [],
    );
  }

  /// `Public channel`
  String get publicChannel {
    return Intl.message(
      'Public channel',
      name: 'publicChannel',
      desc: '',
      args: [],
    );
  }

  /// `Public channels can be found through search, any user can subscribe to them`
  String get publicChannelDescription {
    return Intl.message(
      'Public channels can be found through search, any user can subscribe to them',
      name: 'publicChannelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Private channel`
  String get privateChannel {
    return Intl.message(
      'Private channel',
      name: 'privateChannel',
      desc: '',
      args: [],
    );
  }

  /// `You can subscribe to private channels only by invitation link`
  String get privateChannelDescription {
    return Intl.message(
      'You can subscribe to private channels only by invitation link',
      name: 'privateChannelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Public link`
  String get publicLink {
    return Intl.message(
      'Public link',
      name: 'publicLink',
      desc: '',
      args: [],
    );
  }

  /// `link`
  String get link {
    return Intl.message(
      'link',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `If the channel has a permanent public link, other users will be able to find it and subscribe.\n\n You can use Latin letters (a-z), numbers (0-9) and underscores. The minimum length is 5 characters.`
  String get privateLinkExtended {
    return Intl.message(
      'If the channel has a permanent public link, other users will be able to find it and subscribe.\\n\\n You can use Latin letters (a-z), numbers (0-9) and underscores. The minimum length is 5 characters.',
      name: 'privateLinkExtended',
      desc: '',
      args: [],
    );
  }

  /// `Invitation link`
  String get invitationLink {
    return Intl.message(
      'Invitation link',
      name: 'invitationLink',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `To share`
  String get share {
    return Intl.message(
      'To share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `You can subscribe to the channel using this link. You can reset it at any time.`
  String get publicLinkExtended {
    return Intl.message(
      'You can subscribe to the channel using this link. You can reset it at any time.',
      name: 'publicLinkExtended',
      desc: '',
      args: [],
    );
  }

  /// `recently`
  String get recently {
    return Intl.message(
      'recently',
      name: 'recently',
      desc: '',
      args: [],
    );
  }

  /// `Delete channel`
  String get deleteChannel {
    return Intl.message(
      'Delete channel',
      name: 'deleteChannel',
      desc: '',
      args: [],
    );
  }

  /// `Subscribers`
  String get subscribers {
    return Intl.message(
      'Subscribers',
      name: 'subscribers',
      desc: '',
      args: [],
    );
  }

  /// `Administrators`
  String get administrators {
    return Intl.message(
      'Administrators',
      name: 'administrators',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get block {
    return Intl.message(
      'Block',
      name: 'block',
      desc: '',
      args: [],
    );
  }

  /// `Aelete`
  String get delete {
    return Intl.message(
      'Aelete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `User email`
  String get userEmail {
    return Intl.message(
      'User email',
      name: 'userEmail',
      desc: '',
      args: [],
    );
  }

  /// `Up to {participants_count} participants`
  String upToNParticipants(Object participants_count) {
    return Intl.message(
      'Up to $participants_count participants',
      name: 'upToNParticipants',
      desc: '',
      args: [participants_count],
    );
  }

  /// `Who would you like to invite?`
  String get whoWouldYouLikeToInvite {
    return Intl.message(
      'Who would you like to invite?',
      name: 'whoWouldYouLikeToInvite',
      desc: '',
      args: [],
    );
  }

  /// `Send an invitation`
  String get sendAnInvitation {
    return Intl.message(
      'Send an invitation',
      name: 'sendAnInvitation',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
