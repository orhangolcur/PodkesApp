import 'package:equatable/equatable.dart';
import '../entities/podcast_entitiy.dart';
import '../constants/genre_mapping.dart';

class PodcastModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final Duration duration;
  final String audioUrl;
  final String description;
  final String categoryId;

  const PodcastModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.duration,
    required this.audioUrl,
    required this.description,
    required this.categoryId,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    final podcastData = json['podcast'] ?? {};
    final genreIds = (podcastData['genre_ids'] as List?)?.map((e) => e as int).toList() ?? [];

    return PodcastModel(
      id: json['id'] ?? '',
      title: json['title_original'] ?? '',
      author: podcastData['publisher_original'] ?? '',
      imageUrl: json['image'] ?? '',
      duration: Duration(seconds: json['audio_length_sec'] ?? 0),
      audioUrl: json['audio'] ?? '',
      description: json['description_original'] ?? '',
      categoryId: mapGenreToCategory(genreIds),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_original': title,
      'podcast': {
        'publisher_original': author,
        'genre_ids': [],
      },
      'image': imageUrl,
      'audio_length_sec': duration.inSeconds,
      'audio': audioUrl,
      'description_original': description,
      'category_id': categoryId,
    };
  }

  PodcastModel copyWith({
    String? id,
    String? title,
    String? author,
    String? imageUrl,
    Duration? duration,
    String? audioUrl,
    String? description,
    String? categoryId,
  }) {
    return PodcastModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      duration: duration ?? this.duration,
      audioUrl: audioUrl ?? this.audioUrl,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  factory PodcastModel.fromEntity(PodcastEntity entity) {
    return PodcastModel(
      id: entity.id,
      title: entity.title,
      author: entity.author,
      imageUrl: entity.imageUrl,
      duration: entity.duration,
      audioUrl: entity.audioUrl,
      description: entity.description,
      categoryId: entity.categoryId,
    );
  }

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'PodcastModel(title: $title, author: $author)';
  }
}

extension PodcastMapper on PodcastModel {
  PodcastEntity toEntity() => PodcastEntity(
    id: id,
    title: title,
    author: author,
    imageUrl: imageUrl,
    duration: duration,
    audioUrl: audioUrl,
    description: description,
    categoryId: categoryId,
  );
}
