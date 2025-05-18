import 'package:equatable/equatable.dart';
import '../../../shared/entities/podcast_entitiy.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteUpdated extends FavoriteState {
  final List<PodcastEntity> favorites;

  const FavoriteUpdated(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
