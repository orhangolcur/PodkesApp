import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podkes_app/shared/entities/podcast_entitiy.dart';
import '../../../shared/models/podcast_model.dart';
import '../../../shared/repositories/podcast/podcast_repository.dart';
import 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final PodcastRepository repository;

  List<PodcastEntity> _allPodcasts = [];
  String _searchKeyword = '';
  String _selectedCategoryId = 'all';

  String get selectedCategoryId => _selectedCategoryId;

  DiscoverCubit(this.repository) : super(DiscoverInitial());

  Future<void> fetchPodcasts() async {
    emit(DiscoverLoading());

    try {
      _allPodcasts = await repository.getPodcasts();

      _applyFilters();
    } catch (e) {
      emit(DiscoverError('Podcast yüklenemedi: ${e.toString()}'));
    }
  }

  void updateSearch(String keyword) {
    _searchKeyword = keyword;
    _applyFilters();
  }

  void selectCategory(String categoryId) {
    _selectedCategoryId = categoryId;
    _applyFilters();
  }

  void _applyFilters() {
    List<PodcastEntity> filtered = _allPodcasts;

    if (_searchKeyword.isNotEmpty) {
      final query = _searchKeyword.toLowerCase().trim();
      final keywords = query.split(' ');

      filtered = filtered.where((p) {
        final title = p.title.toLowerCase();
        final author = p.author.toLowerCase();
        return keywords.every((word) =>
        title.contains(word) || author.contains(word));
      }).toList();
    }

    if (_selectedCategoryId != 'all') {
      filtered = filtered.where(
            (p) => p.categoryId.toLowerCase() == _selectedCategoryId.toLowerCase(),
      ).toList();
    }

    emit(DiscoverLoaded(filtered, _selectedCategoryId));
  }

}
