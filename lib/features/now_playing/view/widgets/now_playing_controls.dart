import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

class NowPlayingControls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final void Function(Duration)? onSeek;

  const NowPlayingControls({
    super.key,
    required this.audioPlayer,
    required this.position,
    required this.duration,
    required this.isPlaying,
    this.onSeek,
  });

  bool get _isControlsEnabled => duration > Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10),
          iconSize: 36.sp,
          color: Colors.white,
          onPressed: _isControlsEnabled
              ? () {
            final newPosition = position - const Duration(seconds: 10);
            final clamped = newPosition >= Duration.zero ? newPosition : Duration.zero;

            audioPlayer.seek(clamped);
            onSeek?.call(clamped);
          }
              : null,
        ),
        SizedBox(width: 24.w),

        IconButton(
          icon: Icon(
            isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
          ),
          iconSize: 56.sp,
          color: Colors.white,
          onPressed: _isControlsEnabled
              ? () async {
            if (isPlaying) {
              await audioPlayer.pause();
            } else {
              await audioPlayer.play();
            }
          }
              : null,
        ),
        SizedBox(width: 24.w),

        IconButton(
          icon: const Icon(Icons.forward_10),
          iconSize: 36.sp,
          color: Colors.white,
          onPressed: _isControlsEnabled
              ? () {
            final newPosition = position + const Duration(seconds: 10);
            final clamped = newPosition < duration ? newPosition : duration;

            audioPlayer.seek(clamped);
            onSeek?.call(clamped);
          }
              : null,
        ),
      ],
    );
  }
}
