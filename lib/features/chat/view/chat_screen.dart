// ignore_for_file: deprecated_export_use

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:chat_app/features/chat/file_message_bloc/file_message_bloc.dart';
import 'package:chat_app/features/chat/message_bloc/message_bloc.dart';
import 'package:chat_app/features/chat/messages_bloc/messages_bloc.dart';
import 'package:chat_app/features/chat/widgets/chat_bubble.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.receiverUser});

  final UserListModel receiverUser;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messagesBloc = MessagesBloc(GetIt.I<AbstractChatRepository>());
  final _messageBloc = MessageBloc(GetIt.I<AbstractChatRepository>());
  final _fileMessageBloc = FileMessageBloc(GetIt.I<AbstractChatRepository>());
  final _messageController = TextEditingController();
  final _messagesScrollController = ScrollController();
  bool _isMessageNotEmpty = false;
  bool _showEmoji = false;
  bool _isRecording = false;
  IconData _mediaIcon = Icons.mic;

  var _audioPath = '';
  late AudioRecorder _audioRecorder;
  late AudioPlayer _audioPlayer;
  var bytesBuilder = BytesBuilder();

  @override
  void initState() {
    super.initState();
    _messagesBloc.add(LoadUsersMessages(
        userId: UserPreferences.userModel!.uid,
        otherUserId: widget.receiverUser.uid));

    _messageController.addListener(() {
      setState(() {
        _isMessageNotEmpty = _messageController.text.isNotEmpty;
      });
    });

    _audioRecorder = AudioRecorder();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _messagesScrollController.dispose();
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        setState(() {
          _isRecording = true;
        });
        (await _audioRecorder.startStream(const RecordConfig()))
            .listen((value) {
          bytesBuilder.add(value);
        });
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<String?> saveAudioToFile(BytesBuilder bytesBuilder) async {
    try {
      final appDocDirectory = await getApplicationDocumentsDirectory();
      final audioPath = '${appDocDirectory.path}/chat_app/audios';
      await Directory(audioPath).create(recursive: true);
      final fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
      final fullPath = '$audioPath/$fileName';

      final File file = File(fullPath);
      final savedFile = await file.writeAsBytes(bytesBuilder.toBytes());
      return savedFile.path;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }
    return null;
  }

  Future<void> stopRecording() async {
    try {
      await _audioRecorder.stop();
      final path = await saveAudioToFile(bytesBuilder);
      setState(() {
        _isRecording = false;
        _audioPath = path!;
      });
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final receiverUserModel = widget.receiverUser;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: !_showEmoji,
        onPopInvoked: (pop) {
          if (_showEmoji) {
            setState(() => _showEmoji = !_showEmoji);
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme.primaryColor,
              surfaceTintColor: theme.primaryColor,
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () => AutoRouter.of(context)
                    .push(AnotherUserInfoRoute(userModel: widget.receiverUser)),
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(
                  receiverUserModel.displayName ?? receiverUserModel.email,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  receiverUserModel.isOnline
                      ? S.of(context).online
                      : S.of(context).recently,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              leading: IconButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const UsersListRoute());
                  },
                  icon: const Icon(Icons.arrow_back)),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                    )),
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.search_outlined,
                                  size: 28,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  S.of(context).search,
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
                                  Icons.cleaning_services_outlined,
                                  size: 28,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  S.of(context).clearHistory,
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
                                  Icons.volume_off_outlined,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  S.of(context).disableNotifications,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              )
                            ],
                          ))
                        ]),
              ],
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: BlocBuilder<MessagesBloc, MessagesState>(
                    bloc: _messagesBloc,
                    builder: (context, state) {
                      if (state is MessagesLoaded) {
                        var messagesRender = ListView.builder(
                          controller: _messagesScrollController,
                          itemCount: state.messageList.length,
                          itemBuilder: (context, index) {
                            final message = state.messageList[index];
                            final isMineMessage = message.senderId !=
                                UserPreferences.userModel!.uid;
                            return Container(
                              alignment: isMineMessage
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Padding(
                                padding: isMineMessage
                                    ? const EdgeInsets.all(8)
                                        .copyWith(right: 44)
                                    : const EdgeInsets.all(8)
                                        .copyWith(left: 44),
                                child: Column(
                                  crossAxisAlignment: isMineMessage
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                                  mainAxisAlignment: isMineMessage
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    ChatBubble(
                                      leftSide: isMineMessage,
                                      message: message,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _messagesScrollController.animateTo(
                            _messagesScrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.fastOutSlowIn,
                          );
                        });
                        return messagesRender;
                      }
                      if (state is MessagesLoadingFailure) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Something went wrong",
                                style: theme.textTheme.headlineMedium,
                              ),
                              Text(
                                "Please try again later",
                                style: theme.textTheme.labelSmall
                                    ?.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  _messagesBloc.add(LoadUsersMessages(
                                      userId: UserPreferences.userModel!.uid,
                                      otherUserId: widget.receiverUser.uid));
                                },
                                child: Text(
                                  "Try again",
                                  style: theme.textTheme.bodySmall,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          setState(() => _showEmoji = !_showEmoji);
                        },
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: theme.primaryColor,
                          size: 30,
                        )),
                    Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _messageController,
                          onTap: () {
                            if (_showEmoji) {
                              setState(() => _showEmoji = !_showEmoji);
                            }
                          },
                          style: TextStyle(
                              fontSize: theme.textTheme.bodyMedium?.fontSize,
                              color: Colors.black),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: (_isRecording)
                                  ? S.of(context).recording
                                  : S.of(context).message,
                              hintStyle: const TextStyle(color: Colors.black38),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.zero))),
                    ),
                    if (_isMessageNotEmpty)
                      BlocConsumer<MessageBloc, MessageState>(
                        bloc: _messageBloc,
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              _messageBloc.add(SendUserMessage(
                                  receiverId: receiverUserModel.uid,
                                  message: _messageController.text,
                                  type: MessageType.text));
                            },
                            icon: Icon(
                              Icons.send,
                              color: theme.primaryColor,
                              size: 30,
                            ),
                          );
                        },
                        listener: (context, state) {
                          if (state is MessageSentSuccces) {
                            _messagesBloc.add(LoadUsersMessages(
                                userId: UserPreferences.userModel!.uid,
                                otherUserId: receiverUserModel.uid));
                            _messageController.clear();
                          }
                        },
                      )
                    else
                      Row(
                        children: [
                          BlocConsumer<FileMessageBloc, FileMessageState>(
                            bloc: _fileMessageBloc,
                            builder: (context, state) {
                              return IconButton(
                                  onPressed: () async {
                                    final imagePicker = ImagePicker();

                                    final images = await imagePicker
                                        .pickMultiImage(imageQuality: 70);

                                    if (images.isNotEmpty) {
                                      for (var image in images) {
                                        _fileMessageBloc.add(
                                            SendUserFileMessage(
                                                receiverId:
                                                    receiverUserModel.uid,
                                                file: File(image.path),
                                                type: MessageType.image));
                                      }
                                    }
                                  },
                                  icon: Icon(
                                    Icons.attach_file,
                                    color: theme.primaryColor,
                                    size: 30,
                                  ));
                            },
                            listener: (context, state) {
                              if (state is FileMessageSentSuccces) {
                                _messagesBloc.add(LoadUsersMessages(
                                    userId: UserPreferences.userModel!.uid,
                                    otherUserId: receiverUserModel.uid));
                              }
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_mediaIcon == Icons.mic) {
                                    _mediaIcon = Icons.video_camera_back;
                                  } else {
                                    _mediaIcon = Icons.mic;
                                  }
                                });
                              },
                              onLongPress: () async {
                                if (_mediaIcon == Icons.video_camera_back) {
                                  final picker = ImagePicker();

                                  final video = await picker.pickVideo(
                                    source: ImageSource.gallery,
                                  );

                                  _fileMessageBloc.add(SendUserFileMessage(
                                      receiverId: receiverUserModel.uid,
                                      file: File(video!.path),
                                      type: MessageType.video));
                                } else {
                                  await startRecording();
                                }
                              },
                              onLongPressUp: () async {
                                if (_mediaIcon == Icons.mic) {
                                  await stopRecording();
                                  _fileMessageBloc.add(SendUserFileMessage(
                                      receiverId: receiverUserModel.uid,
                                      file: File(_audioPath),
                                      type: MessageType.audio));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  _mediaIcon,
                                  color: theme.primaryColor,
                                  size: 30,
                                ),
                              ))
                        ],
                      ),
                  ],
                ),
                if (_showEmoji)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: EmojiPicker(
                      textEditingController: _messageController,
                      config: Config(
                        columns: 7,
                        emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      ),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
