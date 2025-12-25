sealed class MoviesBottomNavigationIntent {
  const MoviesBottomNavigationIntent();
}

final class MoviesBottomNavigationInitializationIntent
    extends MoviesBottomNavigationIntent {
  const MoviesBottomNavigationInitializationIntent();
}

final class ChangeIndexIntent extends MoviesBottomNavigationIntent {
  final int index;

  const ChangeIndexIntent({required this.index});
}
