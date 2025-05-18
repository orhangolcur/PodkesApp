import 'package:podkes_app/shared/entities/podcast_entitiy.dart';

abstract class PodcastRepository {
  Future<List<PodcastEntity>> getPodcasts();
}