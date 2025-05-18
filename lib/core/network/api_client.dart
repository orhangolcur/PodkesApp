import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<Map<String, dynamic>> get(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          return data;
        } else {
          throw Exception('Beklenmeyen veri formatı: JSON bir harita değil.');
        }
      } catch (e) {
        throw Exception('JSON çözümleme hatası: $e');
      }
    } else {
      switch (response.statusCode) {
        case 401:
          throw Exception('Yetkisiz erişim (401). Oturum açmanız gerekebilir.');
        case 403:
          throw Exception('Erişim reddedildi (403).');
        case 404:
          throw Exception('İstek yapılan kaynak bulunamadı (404).');
        case 500:
          throw Exception('Sunucu hatası (500). Lütfen daha sonra tekrar deneyin.');
        default:
          throw Exception('API hatası: ${response.statusCode} ${response.reasonPhrase}');
      }
    }
  }
}
