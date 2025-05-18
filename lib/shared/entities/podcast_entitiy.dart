import 'package:equatable/equatable.dart';

class PodcastEntity extends Equatable {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final Duration duration;
  final String audioUrl;
  final String description;
  final String categoryId;

  const PodcastEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.duration,
    required this.audioUrl,
    required this.description,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [id];

  PodcastEntity copyWith({
    String? id,
    String? title,
    String? author,
    String? imageUrl,
    Duration? duration,
    String? audioUrl,
    String? description,
    String? categoryId,
  }) {
    return PodcastEntity(
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'duration': duration.inSeconds,
      'audioUrl': audioUrl,
      'description': description,
      'categoryId': categoryId,
    };
  }

  factory PodcastEntity.fromMap(Map<String, dynamic> map) {
    return PodcastEntity(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      duration: Duration(seconds: map['duration'] ?? 0),
      audioUrl: map['audioUrl'] ?? '',
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
    );
  }
}
