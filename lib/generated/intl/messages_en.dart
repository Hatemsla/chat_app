// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(n) => "${n} participants";

  static String m1(participants_count) => "${participants_count} participants";

  static String m2(participants_count) =>
      "Up to ${participants_count} participants";

  static String m3(time) => "was online at ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Chats": MessageLookupByLibrary.simpleMessage("Chats"),
        "aboutMe": MessageLookupByLibrary.simpleMessage("About me"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "addParticipants":
            MessageLookupByLibrary.simpleMessage("Add participants"),
        "administrators":
            MessageLookupByLibrary.simpleMessage("Administrators"),
        "afterSelectingANewMail": MessageLookupByLibrary.simpleMessage(
            "After selecting a new mail, you will receive a confirmation message to the new mail."),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "block": MessageLookupByLibrary.simpleMessage("Block"),
        "channelName": MessageLookupByLibrary.simpleMessage("Channel Name"),
        "channelSettings":
            MessageLookupByLibrary.simpleMessage("Channel settings"),
        "channelType": MessageLookupByLibrary.simpleMessage("Channel type"),
        "chatName": MessageLookupByLibrary.simpleMessage("Chat name"),
        "choosePhoto": MessageLookupByLibrary.simpleMessage("Choose photo"),
        "clearHistory": MessageLookupByLibrary.simpleMessage("Clear History"),
        "clickToChangeTheMail":
            MessageLookupByLibrary.simpleMessage("Click to change the mail"),
        "clickToChangeThePhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Click to change the phone number"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
        "copy": MessageLookupByLibrary.simpleMessage("Copy"),
        "createChannel":
            MessageLookupByLibrary.simpleMessage("Create a channel"),
        "createGroup": MessageLookupByLibrary.simpleMessage("Create a group"),
        "delete": MessageLookupByLibrary.simpleMessage("Aelete"),
        "deleteChannel": MessageLookupByLibrary.simpleMessage("Delete channel"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "disableNotifications":
            MessageLookupByLibrary.simpleMessage("Disable notifications"),
        "disabled": MessageLookupByLibrary.simpleMessage("Disabled"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enabled": MessageLookupByLibrary.simpleMessage("Enabled"),
        "enterCorrectEmail":
            MessageLookupByLibrary.simpleMessage("Enter correct Email"),
        "enterCorrectPhone":
            MessageLookupByLibrary.simpleMessage("Enter correct Phone"),
        "enterTheNameOfTheGroup":
            MessageLookupByLibrary.simpleMessage("Enter the name of the group"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "exitGroup": MessageLookupByLibrary.simpleMessage("Leave the group"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "groupDescription":
            MessageLookupByLibrary.simpleMessage("Description of the group"),
        "groupName": MessageLookupByLibrary.simpleMessage("Group name"),
        "information": MessageLookupByLibrary.simpleMessage("Information"),
        "invitationLink":
            MessageLookupByLibrary.simpleMessage("Invitation link"),
        "languageSettings":
            MessageLookupByLibrary.simpleMessage("Language settings"),
        "leaveTheGroup":
            MessageLookupByLibrary.simpleMessage("Leave the group"),
        "link": MessageLookupByLibrary.simpleMessage("link"),
        "logInNow": MessageLookupByLibrary.simpleMessage("Log in now"),
        "mailRequired": MessageLookupByLibrary.simpleMessage("Mail(required)"),
        "message": MessageLookupByLibrary.simpleMessage("Message"),
        "min6Symbols": MessageLookupByLibrary.simpleMessage("Min 6 symbols"),
        "nParticipants": m0,
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "notAMember": MessageLookupByLibrary.simpleMessage("Not a member?"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "online": MessageLookupByLibrary.simpleMessage("online"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Or continue with"),
        "participantsCountOfParticipants": m1,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "personalInformation":
            MessageLookupByLibrary.simpleMessage("Personal information"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "phoneNumberRequired":
            MessageLookupByLibrary.simpleMessage("Phone number(required)"),
        "privateChannel":
            MessageLookupByLibrary.simpleMessage("Private channel"),
        "privateChannelDescription": MessageLookupByLibrary.simpleMessage(
            "You can subscribe to private channels only by invitation link"),
        "privateLinkExtended": MessageLookupByLibrary.simpleMessage(
            "If the channel has a permanent public link, other users will be able to find it and subscribe.\\n\\n You can use Latin letters (a-z), numbers (0-9) and underscores. The minimum length is 5 characters."),
        "publicChannel": MessageLookupByLibrary.simpleMessage("Public channel"),
        "publicChannelDescription": MessageLookupByLibrary.simpleMessage(
            "Public channels can be found through search, any user can subscribe to them"),
        "publicLink": MessageLookupByLibrary.simpleMessage("Public link"),
        "publicLinkExtended": MessageLookupByLibrary.simpleMessage(
            "You can subscribe to the channel using this link. You can reset it at any time."),
        "recently": MessageLookupByLibrary.simpleMessage("recently"),
        "registerNow": MessageLookupByLibrary.simpleMessage("Register now"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "searchForParticipants":
            MessageLookupByLibrary.simpleMessage("Search for participants"),
        "sendAnInvitation":
            MessageLookupByLibrary.simpleMessage("Send an invitation"),
        "setANewPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Set a new phone number"),
        "setTheUserEmail":
            MessageLookupByLibrary.simpleMessage("Set the user\'s email"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("To share"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong..."),
        "sortingByLoginTime":
            MessageLookupByLibrary.simpleMessage("Sorting by login time"),
        "subscribers": MessageLookupByLibrary.simpleMessage("Subscribers"),
        "theTextIsCopiedToTheClipboard": MessageLookupByLibrary.simpleMessage(
            "The text is copied to the clipboard."),
        "upToNParticipants": m2,
        "updateName": MessageLookupByLibrary.simpleMessage("Update name"),
        "updatePhone": MessageLookupByLibrary.simpleMessage("Update phone"),
        "userEmail": MessageLookupByLibrary.simpleMessage("User email"),
        "userInformation":
            MessageLookupByLibrary.simpleMessage("User Information"),
        "wasOnlineAtTime": m3,
        "wasRecently": MessageLookupByLibrary.simpleMessage("was recently"),
        "whoWouldYouLikeToInvite": MessageLookupByLibrary.simpleMessage(
            "Who would you like to invite?"),
        "youCanAddAFewLinesAboutYourself": MessageLookupByLibrary.simpleMessage(
            "You can add a few lines about yourself.")
      };
}
