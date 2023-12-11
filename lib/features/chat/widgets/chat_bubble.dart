// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/features/chat/widgets/controls_overlay.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.leftSide,
  });

  final Message message;
  final bool leftSide;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  late VideoPlayerController _videoController;
  late final AudioPlayer _audioPlayer;
  late ThemeData theme;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  bool _isAudioPlaying = false;

  @override
  void dispose() {
    if (widget.message.type == MessageType.video) {
      if (_videoController.value.isInitialized) {
        _videoController.dispose();
      }
    }
    if (widget.message.type == MessageType.audio) {
      _audioPlayer.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (widget.message.type == MessageType.video) {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.message.message))
            ..initialize().then((_) {
              setState(() {});
            });
      _videoController.setVolume(1);
    } else if (widget.message.type == MessageType.audio) {
      _audioPlayer = AudioPlayer();

      _audioPlayer.setSourceUrl(widget.message.message);

      _audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          totalDuration = newDuration;
        });
      });

      _audioPlayer.onPlayerStateChanged.listen((event) {
        setState(() {
          if (event == PlayerState.completed) {
            _isAudioPlaying = false;
          }
        });
      });

      _audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          currentPosition = newPosition;
        });
      });
    }
  }

  Widget _getMessage(MessageType type) {
    if (type == MessageType.text) {
      return Text(
        widget.message.message,
        style: TextStyle(
            fontSize: theme.textTheme.bodyMedium?.fontSize,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      );
    } else if (type == MessageType.image) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: widget.message.message,
          placeholder: (context, url) => const Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const CircleAvatar(
            child: Icon(
              Icons.person,
              size: 70,
            ),
          ),
        ),
      );
    } else if (type == MessageType.video) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _videoController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    VideoPlayer(_videoController),
                    ClosedCaption(
                      text: _videoController.value.caption.text,
                    ),
                    ControlsOverlay(controller: _videoController),
                    VideoProgressIndicator(_videoController,
                        allowScrubbing: true)
                  ]),
                )
              : Container());
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  if (_isAudioPlaying) {
                    _audioPlayer.pause();
                  } else {
                    if (currentPosition.inSeconds == totalDuration.inSeconds) {
                      _audioPlayer.play(UrlSource(widget.message.message));
                    } else {
                      _audioPlayer.resume();
                    }
                  }

                  setState(() {
                    _isAudioPlaying = !_isAudioPlaying;
                  });
                },
                child: _isAudioPlaying
                    ? const Icon(
                        Icons.pause,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Slider(
                      min: 0,
                      max: totalDuration.inSeconds.toDouble(),
                      value: currentPosition.inSeconds.toDouble(),
                      onChanged: (value) {
                        final position = Duration(seconds: value.toInt());
                        _audioPlayer.seek(position);
                        _audioPlayer.resume();
                      },
                      thumbColor: theme.primaryColor,
                      activeColor: theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              _isAudioPlaying
                  ? _formatDuration(currentPosition)
                  : _formatDuration(totalDuration),
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }

  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: (widget.leftSide)
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16))
              : const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
          color: (widget.leftSide)
              ? const Color(0xff30d1a7)
              : theme.primaryColor.withOpacity(0.7)),
      child: _getMessage(widget.message.type),
    );
  }
}
