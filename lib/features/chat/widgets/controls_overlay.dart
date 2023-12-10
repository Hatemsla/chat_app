import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 50),
              reverseDuration: const Duration(milliseconds: 200),
              child: controller.value.isPlaying
                  ? const SizedBox.shrink()
                  : Container(
                      key: ValueKey<bool>(!controller.value.isPlaying),
                      color: Colors.black26,
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 100.0,
                          semanticLabel: 'Play',
                        ),
                      ),
                    ),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        )
      ],
    );
  }
}
