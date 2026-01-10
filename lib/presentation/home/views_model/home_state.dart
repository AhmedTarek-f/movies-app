import 'package:equatable/equatable.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';

final class HomeState extends Equatable {
  final StateStatus<List<MovieEntity>> moviesStatus;
  final MovieEntity? selectedMovie;
  final int? currentIndex;
  final bool isLoadingMoreMovies;
  final List<MovieEntity> actionMovies;

  const HomeState({
    this.moviesStatus = const StateStatus.initial(),
    this.selectedMovie,
    this.currentIndex,
    this.isLoadingMoreMovies = false,
    this.actionMovies = const [],
  });

  HomeState copyWith({
    StateStatus<List<MovieEntity>>? moviesStatus,
    MovieEntity? selectedMovie,
    int? currentIndex,
    bool? isLoadingMoreMovies,
    List<MovieEntity>? actionMovies,
  }) {
    return HomeState(
      moviesStatus: moviesStatus ?? this.moviesStatus,
      selectedMovie: selectedMovie ?? this.selectedMovie,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoadingMoreMovies: isLoadingMoreMovies ?? this.isLoadingMoreMovies,
      actionMovies: actionMovies ?? this.actionMovies,
    );
  }

  @override
  List<Object?> get props => [
    moviesStatus,
    selectedMovie,
    currentIndex,
    isLoadingMoreMovies,
    actionMovies,
  ];
}
