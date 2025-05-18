import 'package:podkes_app/core/network/api_client.dart';
import 'package:podkes_app/shared/models/podcast_model.dart';
import 'package:podkes_app/shared/repositories/podcast/podcast_repository.dart';
import '../../entities/podcast_entitiy.dart';

class PodcastApiRepository implements PodcastRepository {
  final ApiClient _apiClient;

  PodcastApiRepository(this._apiClient);

  @override
  Future<List<PodcastEntity>> getPodcasts() async {
    try {
      final jsonData = await _apiClient.get('/search?q=podcast');
      final results = jsonData['results'];

      if (results == null || results is! List) {
        throw Exception('Unexpected response format');
      }

      final List<PodcastEntity> podcasts = [];
      final List<Map<String, dynamic>> failedItems = [];

      for (final item in results) {
        try {
          final podcast = PodcastModel.fromJson(item).toEntity();
          podcasts.add(podcast);
        } catch (e) {
          print('Hatalı veri atlandı: $e');
          if (item is Map<String, dynamic>) {
            failedItems.add(item);
          }
        }
      }

      if (failedItems.isNotEmpty) {
        print('Toplam ${failedItems.length} veri dönüştürülemedi.');
      }

      return podcasts;
    } catch (e) {
      print('Podcast verisi alınırken hata oluştu: $e');
      throw Exception('Podcast listesi yüklenemedi. Lütfen daha sonra tekrar deneyin.');
    }
  }
}
