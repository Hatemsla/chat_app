// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(n) => "${n} участников";

  static String m1(participants_count) => "${participants_count} участников";

  static String m2(participants_count) => "До ${participants_count} участников";

  static String m3(time) => "был(а) в сети в ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Chats": MessageLookupByLibrary.simpleMessage("Чаты"),
        "aboutMe": MessageLookupByLibrary.simpleMessage("О себе"),
        "account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
        "addParticipants":
            MessageLookupByLibrary.simpleMessage("Добавить участников"),
        "administrators":
            MessageLookupByLibrary.simpleMessage("Администраторы"),
        "afterSelectingANewMail": MessageLookupByLibrary.simpleMessage(
            "После выбора новой почты, вам придет сообщение на новую почту с подтверждением."),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт?"),
        "block": MessageLookupByLibrary.simpleMessage("Заблокировать"),
        "channelName": MessageLookupByLibrary.simpleMessage("Имя канала"),
        "channelSettings":
            MessageLookupByLibrary.simpleMessage("Настройки канала"),
        "channelType": MessageLookupByLibrary.simpleMessage("Тип канала"),
        "chatName": MessageLookupByLibrary.simpleMessage("Название чата"),
        "choosePhoto":
            MessageLookupByLibrary.simpleMessage("Выбрать фотографию"),
        "clearHistory":
            MessageLookupByLibrary.simpleMessage("Очистить историю"),
        "clickToChangeTheMail": MessageLookupByLibrary.simpleMessage(
            "Нажмите, чтобы изменить почту"),
        "clickToChangeThePhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Нажмите, чтобы изменить номер телефона"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Подтвердить пароль"),
        "contacts": MessageLookupByLibrary.simpleMessage("Контакты"),
        "copy": MessageLookupByLibrary.simpleMessage("Скопировать"),
        "createChannel": MessageLookupByLibrary.simpleMessage("Создать канал"),
        "createGroup": MessageLookupByLibrary.simpleMessage("Создать группу"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteChannel": MessageLookupByLibrary.simpleMessage("Удалить канал"),
        "deleteTheChannel":
            MessageLookupByLibrary.simpleMessage("Удалить канал"),
        "deleteTheGroup":
            MessageLookupByLibrary.simpleMessage("Удалить группу"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "disableNotifications":
            MessageLookupByLibrary.simpleMessage("Выключить уведомления"),
        "disabled": MessageLookupByLibrary.simpleMessage("Выключены"),
        "email": MessageLookupByLibrary.simpleMessage("Почта"),
        "enabled": MessageLookupByLibrary.simpleMessage("Включены"),
        "enterTheNameOfTheGroup":
            MessageLookupByLibrary.simpleMessage("Введите имя группы"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "exit": MessageLookupByLibrary.simpleMessage("Выход"),
        "exitGroup": MessageLookupByLibrary.simpleMessage("Покинуть группу"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "groupDescription":
            MessageLookupByLibrary.simpleMessage("Описание группы"),
        "groupName": MessageLookupByLibrary.simpleMessage("Имя группы"),
        "information": MessageLookupByLibrary.simpleMessage("Информация"),
        "invitationLink":
            MessageLookupByLibrary.simpleMessage("Ссылка-приглашение"),
        "languageSettings":
            MessageLookupByLibrary.simpleMessage("Настройки языка"),
        "leaveTheChannel":
            MessageLookupByLibrary.simpleMessage("Покинуть канал"),
        "leaveTheGroup":
            MessageLookupByLibrary.simpleMessage("Покинуть группу"),
        "link": MessageLookupByLibrary.simpleMessage("cсылка"),
        "logInNow": MessageLookupByLibrary.simpleMessage("Войти в систему"),
        "mailRequired":
            MessageLookupByLibrary.simpleMessage("Почта(обязательно)"),
        "message": MessageLookupByLibrary.simpleMessage("Сообщение"),
        "messagesAreBlocked":
            MessageLookupByLibrary.simpleMessage("Сообщения запрещены"),
        "min6Symbols":
            MessageLookupByLibrary.simpleMessage("Минимально 6 символов"),
        "nParticipants": m0,
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "notAMember": MessageLookupByLibrary.simpleMessage("Не член клуба?"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "online": MessageLookupByLibrary.simpleMessage("в сети"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Или продолжить с"),
        "participantsCountOfParticipants": m1,
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordsNotEqual":
            MessageLookupByLibrary.simpleMessage("Пароли не равны"),
        "personalInformation":
            MessageLookupByLibrary.simpleMessage("Данные о себе"),
        "phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Номер телефона"),
        "phoneNumberRequired":
            MessageLookupByLibrary.simpleMessage("Телефон(обязательно)"),
        "pleaseTryAgainLater": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, попробуйте еще раз"),
        "privateChannel": MessageLookupByLibrary.simpleMessage("Частный канал"),
        "privateChannelDescription": MessageLookupByLibrary.simpleMessage(
            "На частные каналы можно подписаться только по ссылке-приглашению"),
        "privateLinkExtended": MessageLookupByLibrary.simpleMessage(
            "Если у канала будет постоянная публичная ссылка, другие пользователи смогут найти его и подписаться.\\n\\nМожно использовать латиницу (a-z), цифры (0-9) и подчёркивание. Минимальная длина - 5 символов."),
        "publicChannel":
            MessageLookupByLibrary.simpleMessage("Публичный канал"),
        "publicChannelDescription": MessageLookupByLibrary.simpleMessage(
            "Публичные каналы можно найти через поиск, подписаться на них может любой пользователь"),
        "publicLink": MessageLookupByLibrary.simpleMessage("Публичная ссылка"),
        "publicLinkExtended": MessageLookupByLibrary.simpleMessage(
            "По этой ссылке можно подписаться на канал. Вы можете сбросить ее в любой момент."),
        "recently": MessageLookupByLibrary.simpleMessage("недавно"),
        "recording": MessageLookupByLibrary.simpleMessage("Запись.."),
        "registerNow":
            MessageLookupByLibrary.simpleMessage("Зарегистрируйтесь сейчас"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "searchForParticipants":
            MessageLookupByLibrary.simpleMessage("Поиск участников"),
        "sendAnInvitation":
            MessageLookupByLibrary.simpleMessage("Отправить приглашение"),
        "setANewPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Задать новый телефон"),
        "setTheUserEmail":
            MessageLookupByLibrary.simpleMessage("Задать почту пользователя"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти в систему"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегестрироваться"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так..."),
        "sortingByLoginTime":
            MessageLookupByLibrary.simpleMessage("Сортировка по времени входа"),
        "subscribers": MessageLookupByLibrary.simpleMessage("Подписчики"),
        "theTextIsCopiedToTheClipboard": MessageLookupByLibrary.simpleMessage(
            "Текст скопирован в буффер обмена."),
        "upToNParticipants": m2,
        "updateName": MessageLookupByLibrary.simpleMessage("Изменить имя"),
        "updatePhone": MessageLookupByLibrary.simpleMessage("Изменить телефон"),
        "userEmail": MessageLookupByLibrary.simpleMessage("Почта пользователя"),
        "userInformation":
            MessageLookupByLibrary.simpleMessage("Информация о пользователе"),
        "wasOnlineAtTime": m3,
        "wasRecently": MessageLookupByLibrary.simpleMessage("был(а) недавно"),
        "whoWouldYouLikeToInvite": MessageLookupByLibrary.simpleMessage(
            "Кого бы Вы хотели пригласить?"),
        "youCanAddAFewLinesAboutYourself": MessageLookupByLibrary.simpleMessage(
            "Вы можете добавить несколько строк о себе.")
      };
}
