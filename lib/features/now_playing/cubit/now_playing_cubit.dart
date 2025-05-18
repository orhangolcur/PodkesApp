import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/entities/podcast_entitiy.dart';
import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());

  void setPodcast(PodcastEntity podcast) {
    emit(NowPlayingLoaded(podcast));
  }

  PodcastEntity? get current => state is NowPlayingLoaded
      ? (state as NowPlayingLoaded).podcast
      : null;
}
