// ignore_for_file: deprecated_export_use

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/chat/widgets/chat_bubble.dart';
import 'package:chat_app/features/group_chat/group_file_message_bloc/group_file_message_bloc.dart';
import 'package:chat_app/features/group_chat/group_message_bloc/group_message_bloc.dart';
import 'package:chat_app/features/group_chat/group_messages_bloc/group_messages_bloc.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/group/abstract_group_repositpry.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class ChannelChatScreen extends StatefulWidget {
  const ChannelChatScreen({super.key, required this.channelModel});

  final GroupListModel channelModel;

  @override
  State<ChannelChatScreen> createState() => _ChannelChatScreenState();
}

class _ChannelChatScreenState extends State<ChannelChatScreen> {
  final _messagesBloc = GroupMessagesBloc(GetIt.I<AbstractGroupRepository>());
  final _messageBloc = GroupMessageBloc(GetIt.I<AbstractGroupRepository>());
  final _fileMessageBloc =
      GroupFileMessageBloc(GetIt.I<AbstractGroupRepository>());
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
    _messagesBloc.add(LoadGroupUsersMessages(
        userId: UserPreferences.userModel!.uid,
        groupId: widget.channelModel.uid));

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          surfaceTintColor: theme.primaryColor,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () =>
                AutoRouter.of(context).push(const ChannelChatInfoRoute()),
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              widget.channelModel.name,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              S.of(context).participantsCountOfParticipants(
                  widget.channelModel.members.length),
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const UsersListRoute());
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
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
                      )),
                      PopupMenuItem(
                          onTap: () => AutoRouter.of(context)
                              .popAndPush(const UsersListRoute()),
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
                                  S.of(context).exitGroup,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          )),
                    ]),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<GroupMessagesBloc, GroupMessagesState>(
                bloc: _messagesBloc,
                builder: (context, state) {
                  if (state is GroupMessagesLoaded) {
                    var messagesRender = ListView.builder(
                      controller: _messagesScrollController,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        final isMineMessage =
                            message.senderId != UserPreferences.userModel!.uid;
                        return Container(
                          alignment: isMineMessage
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Padding(
                            padding: isMineMessage
                                ? const EdgeInsets.all(8).copyWith(right: 44)
                                : const EdgeInsets.all(8).copyWith(left: 44),
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
                                Text(message.senderEmail),
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
                  if (state is GroupMessagesLoaded) {
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
                              _messagesBloc.add(LoadGroupUsersMessages(
                                  userId: UserPreferences.userModel!.uid,
                                  groupId: widget.channelModel.uid));
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
            if (widget.channelModel.creator == UserPreferences.userModel!.uid)
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
                    BlocConsumer<GroupMessageBloc, GroupMessageState>(
                      bloc: _messageBloc,
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            _messageBloc.add(SendGroupMessage(
                                receiverId: widget.channelModel.uid,
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
                        if (state is GroupMessageSentSuccces) {
                          _messagesBloc.add(LoadGroupUsersMessages(
                              userId: UserPreferences.userModel!.uid,
                              groupId: widget.channelModel.uid));
                          _messageController.clear();
                        }
                      },
                    )
                  else
                    Row(
                      children: [
                        BlocConsumer<GroupFileMessageBloc,
                            GroupFileMessageState>(
                          bloc: _fileMessageBloc,
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () async {
                                  final imagePicker = ImagePicker();

                                  final images = await imagePicker
                                      .pickMultiImage(imageQuality: 70);

                                  if (images.isNotEmpty) {
                                    for (var image in images) {
                                      _fileMessageBloc.add(SendGroupFileMessage(
                                          groupId: widget.channelModel.uid,
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
                            if (state is GroupFileMessageSentSuccces) {
                              _messagesBloc.add(LoadGroupUsersMessages(
                                  userId: UserPreferences.userModel!.uid,
                                  groupId: widget.channelModel.uid));
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

                                _fileMessageBloc.add(SendGroupFileMessage(
                                    groupId: widget.channelModel.uid,
                                    file: File(video!.path),
                                    type: MessageType.video));
                              } else {
                                await startRecording();
                              }
                            },
                            onLongPressUp: () async {
                              if (_mediaIcon == Icons.mic) {
                                await stopRecording();
                                _fileMessageBloc.add(SendGroupFileMessage(
                                    groupId: widget.channelModel.uid,
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
              )
            else
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.black12,
                child: Center(
                    child: Text(
                  S.of(context).messagesAreBlocked,
                  style: const TextStyle(color: Colors.black26, fontSize: 16),
                )),
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
        ));
  }
}
