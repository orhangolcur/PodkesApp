import 'dart:convert';
import 'dart:collection';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/favorites/cubit/favorite_state.dart';
import '../../../shared/entities/podcast_entitiy.dart';
import '../../../shared/models/podcast_model.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  static const _storageKey = 'favorite_podcasts';

  FavoriteCubit() : super(const FavoriteUpdated([]));

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString != null) {
      try {
        final List<dynamic> decoded = json.decode(jsonString);
        final favorites = decoded
            .map((e) => PodcastModel.fromJson(e as Map<String, dynamic>).toEntity())
            .toList();
        emit(FavoriteUpdated(favorites));
      } catch (e) {
        print('Favoriler yüklenirken hata oluştu: $e');
        emit(const FavoriteUpdated([]));
      }
    }
  }

  void toggleFavorite(PodcastEntity podcast) async {
    final currentState = state;
    if (currentState is FavoriteUpdated) {
      final currentFavorites = List<PodcastEntity>.from(currentState.favorites);
      if (currentFavorites.contains(podcast)) {
        currentFavorites.remove(podcast);
      } else {
        currentFavorites.add(podcast);
      }

      emit(FavoriteUpdated(currentFavorites));
      await _saveFavorites(currentFavorites);
    }
  }

  bool isFavorite(PodcastEntity podcast) {
    final currentState = state;
    return currentState is FavoriteUpdated &&
        currentState.favorites.contains(podcast);
  }

  UnmodifiableListView<PodcastEntity> get favorites {
    final currentState = state;
    if (currentState is FavoriteUpdated) {
      return UnmodifiableListView(currentState.favorites);
    }
    return UnmodifiableListView([]);
  }

  Future<void> _saveFavorites(List<PodcastEntity> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = favorites.map((e) => PodcastModel.fromEntity(e).toJson()).toList();
    await prefs.setString(_storageKey, json.encode(jsonList));
  }
}
