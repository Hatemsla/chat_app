import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/chat/message_bloc/message_bloc.dart';
import 'package:chat_app/features/chat/messages_bloc/messages_bloc.dart';
import 'package:chat_app/features/chat/widgets/chat_bubble.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/chat/abstract_chat_repository.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.receiverUser});

  final UserModel receiverUser;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messagesBloc = MessagesBloc(GetIt.I<AbstractChatRepository>());
  final _messageBloc = MessageBloc(GetIt.I<AbstractChatRepository>());
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _messagesScrollController = ScrollController();
  bool isMessageNotEmpty = false;

  @override
  void initState() {
    _messagesBloc.add(LoadUsersMessages(
        userId: UserPreferences.userModel!.uid,
        otherUserId: widget.receiverUser.uid));

    _messageController.addListener(() {
      setState(() {
        isMessageNotEmpty = _messageController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _messagesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final receiverUserModel = widget.receiverUser;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          surfaceTintColor: theme.primaryColor,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () =>
                AutoRouter.of(context).push(const AnotherUserInfoRoute()),
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
                    return ListView.builder(
                      controller: _messagesScrollController,
                      itemCount: state.messageList.length,
                      itemBuilder: (context, index) {
                        final message = state.messageList[index];
                        final isMineMessage =
                            message.senderId != UserPreferences.userModel!.uid;

                        if (index == state.messageList.length - 1) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _messagesScrollController.animateTo(
                              _messagesScrollController
                                  .position.maxScrollExtent,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                        }
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
                                ChatBubble(
                                    leftSide: isMineMessage,
                                    message: message.message),
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.black26,
                      size: 30,
                    )),
                Expanded(
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _messageController,
                      style: TextStyle(
                          fontSize: theme.textTheme.bodyMedium?.fontSize,
                          color: Colors.black),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: S.of(context).message,
                          hintStyle: const TextStyle(color: Colors.black38),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.zero),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.zero))),
                ),
                if (isMessageNotEmpty)
                  BlocConsumer<MessageBloc, MessageState>(
                    bloc: _messageBloc,
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          _messageBloc.add(SendUserMessage(
                              receiverId: receiverUserModel.uid,
                              message: _messageController.text));
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
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file,
                            color: theme.primaryColor,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: theme.primaryColor,
                            size: 30,
                          ))
                    ],
                  ),
              ],
            )
          ],
        ));
  }
}
