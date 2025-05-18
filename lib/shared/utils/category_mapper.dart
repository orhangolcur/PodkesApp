import '../constants/categories_constants.dart';

class CategoryMapper {
  static String assignCategoryId(String title) {
    final lowerTitle = title.toLowerCase();

    for (final category in categories) {
      if (lowerTitle.contains(category.name.toLowerCase())) {
        return category.id;
      }
    }

    return 'all';
  }
}
