sealed class HomeIntent {
  const HomeIntent();
}

final class HomeInitializationIntent extends HomeIntent {
  const HomeInitializationIntent();
}

final class FetchMoviesIntent extends HomeIntent {
  const FetchMoviesIntent();
}

final class ChangeSelectedMovieIntent extends HomeIntent {
  final int index;

  const ChangeSelectedMovieIntent({required this.index});
}

final class LoadMoreMoviesIntent extends HomeIntent {
  const LoadMoreMoviesIntent();
}
