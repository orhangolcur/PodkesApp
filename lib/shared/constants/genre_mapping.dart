const Map<int, String> genreIdToCategoryId = {
  68: 'technology',
  264: 'technology',
  263: 'technology',

  133: 'comedy',
  134: 'comedy',

  82: 'health',
  83: 'health',
  85: 'health',
  86: 'health',
  122: 'health',

  99: 'education',
  100: 'education',
  265: 'education',

  77: 'sports',
};


String mapGenreToCategory(List<dynamic> genreIds) {
  for (final id in genreIds) {
    if (genreIdToCategoryId.containsKey(id)) {
      return genreIdToCategoryId[id]!;
    }
  }
  return 'all';
}
