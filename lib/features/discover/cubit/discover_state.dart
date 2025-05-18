import 'package:equatable/equatable.dart';
import 'package:podkes_app/shared/entities/podcast_entitiy.dart';
import '../../../shared/models/podcast_model.dart';

abstract class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object?> get props => const [];
}

class DiscoverInitial extends DiscoverState {}

class DiscoverLoading extends DiscoverState {}

class DiscoverLoaded extends DiscoverState {
  final List<PodcastEntity> podcasts;
  final String selectedCategoryId;

  const DiscoverLoaded(this.podcasts, this.selectedCategoryId);

  @override
  List<Object?> get props => [podcasts, selectedCategoryId];

  @override
  String toString() => 'DiscoverLoaded(count: ${podcasts.length}, selectedCategory: $selectedCategoryId)';
}

class DiscoverError extends DiscoverState {
  final String message;

  const DiscoverError(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => 'DiscoverError: $message';
}
