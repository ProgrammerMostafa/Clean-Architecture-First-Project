class APIConstant {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String appAPIKey = '09eb51c063ec501f41fa52a62204ac62';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$appAPIKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$appAPIKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$appAPIKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String url) => '$baseImageUrl$url';

  static String movieDetailsPath(int movieID) =>
      '$baseUrl/movie/$movieID?api_key=$appAPIKey';

  static String recommendationsPath(int movieID) =>
      '$baseUrl/movie/$movieID/recommendations?api_key=$appAPIKey';
}
