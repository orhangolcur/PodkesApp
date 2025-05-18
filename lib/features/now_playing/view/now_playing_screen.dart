import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import '../../../shared/entities/podcast_entitiy.dart';
import '../../favorites/cubit/favorite_cubit.dart';
import '../../favorites/cubit/favorite_state.dart';
import 'widgets/now_playing_controls.dart';

class NowPlayingScreen extends StatefulWidget {
  final PodcastEntity podcast;

  const NowPlayingScreen({super.key, required this.podcast});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _audioPlayer.setLoopMode(LoopMode.off);

      final source = AudioSource.uri(Uri.parse(widget.podcast.audioUrl));
      await _audioPlayer.setAudioSource(source, preload: true);

      _audioPlayer.durationStream.listen((dur) {
        if (dur != null && mounted) {
          setState(() => _duration = dur);
        }
      });

      _audioPlayer.positionStream.listen((pos) {
        if (mounted) {
          setState(() => _position = pos);
        }
      });

      _audioPlayer.playerStateStream.listen((state) async {
        final isPlaying = state.playing;
        final processing = state.processingState;

        if (mounted) {
          setState(() {
            _isPlaying = isPlaying && processing != ProcessingState.completed;
          });
        }

        if (processing == ProcessingState.completed) {
          await _audioPlayer.seek(Duration.zero);
          await _audioPlayer.stop();
          setState(() => _position = Duration.zero);
        }
      });
    } catch (e) {
      debugPrint('Ses yüklenemedi: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final podcast = widget.podcast;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1B2D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => context.pop(),
        ),
        title: Text('Now Playing', style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
        actions: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              final isFav = context.read<FavoriteCubit>().isFavorite(podcast);
              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.white,
                  size: 24.sp,
                ),
                onPressed: () {
                  context.read<FavoriteCubit>().toggleFavorite(podcast);
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600.w),
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: SizedBox(
                        width: 0.7.sw,
                        height: 0.7.sw,
                        child: Image.network(
                          podcast.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.podcasts,
                            color: Colors.white30,
                            size: 64.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      podcast.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      podcast.author,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    Slider(
                      value: _duration.inSeconds > 0
                          ? _position.inSeconds.clamp(0, _duration.inSeconds).toDouble()
                          : 0.0,
                      max: _duration.inSeconds > 0 ? _duration.inSeconds.toDouble() : 1.0,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white24,
                      onChanged: _duration.inSeconds > 0
                          ? (value) => _audioPlayer.seek(Duration(seconds: value.toInt()))
                          : null,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_position),
                            style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              _duration.inSeconds > 0
                                  ? _formatDuration(_duration)
                                  : '--:--',
                              key: ValueKey(_duration.inSeconds),
                              style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    NowPlayingControls(
                      audioPlayer: _audioPlayer,
                      position: _position,
                      duration: _duration,
                      isPlaying: _isPlaying,
                      onSeek: (newPos) {
                        setState(() {
                          _position = newPos;
                        });
                      },
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
