import 'package:podkes_app/shared/entities/podcast_entitiy.dart';

abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final PodcastEntity podcast;
  NowPlayingLoaded(this.podcast);
}
