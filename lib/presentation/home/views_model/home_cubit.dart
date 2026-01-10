import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';
import 'package:movies_app/domain/use_cases/home/get_all_movies_use_case.dart';
import 'package:movies_app/presentation/home/views_model/home_intent.dart';
import 'package:movies_app/presentation/home/views_model/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllMoviesUseCase _getAllMoviesUseCase;
  int _page = 0;

  HomeCubit(this._getAllMoviesUseCase) : super(const HomeState());

  Future<void> doIntent(HomeIntent intent) async {
    switch (intent) {
      case HomeInitializationIntent():
        await _onInit();
      case FetchMoviesIntent():
        await _fetchMovies();
        break;
      case ChangeSelectedMovieIntent():
        _changeSelectedMovie(index: intent.index);
        break;
      case LoadMoreMoviesIntent():
        await _loadMoreMovies();
        break;
    }
  }

  Future<void> _onInit() async {
    fetchCachedMovies();
  }

  Future<void> fetchCachedMovies() async {
    final cachedResult = _getAllMoviesUseCase.getCachedMovies();
    final actionMovies = cachedResult
        .where((movie) => movie.genres?.contains('Action') ?? false)
        .toList();
    if (cachedResult.isNotEmpty) {
      _page = (cachedResult.length ~/ 20);
      emit(
        state.copyWith(
          moviesStatus: StateStatus.success(cachedResult),
          selectedMovie: cachedResult[cachedResult.length ~/ 2],
          currentIndex: cachedResult.length ~/ 2,
          actionMovies: actionMovies,
        ),
      );
    } else {
      await _fetchMovies();
    }
  }

  Future<void> _fetchMovies({int? limit}) async {
    if (state.moviesStatus.data == null) {
      emit(state.copyWith(moviesStatus: const StateStatus.loading()));
    } else {
      emit(state.copyWith(isLoadingMoreMovies: true));
    }
    final result = await _getAllMoviesUseCase.invoke(page: _page, limit: limit);
    if (isClosed) return;
    switch (result) {
      case Success<List<MovieEntity>>():
        final freshMovies = result.successData;
        final currentMovies = state.moviesStatus.data ?? [];
        List<MovieEntity> allMovies = [];

        if (_page == 1) {
          final freshIds = freshMovies.map((e) => e.movieId).toSet();
          final keptCached = currentMovies
              .where((m) => !freshIds.contains(m.movieId))
              .toList();
          allMovies = [...freshMovies, ...keptCached];
        } else {
          final currentIds = currentMovies.map((e) => e.movieId).toSet();
          final uniqueFresh = freshMovies
              .where((m) => !currentIds.contains(m.movieId))
              .toList();
          allMovies = [...currentMovies, ...uniqueFresh];
        }
        final actionMovies = allMovies
            .where((movie) => movie.genres?.contains('Action') ?? false)
            .toList();
        emit(
          state.copyWith(
            moviesStatus: StateStatus.success(allMovies),
            selectedMovie:
                state.selectedMovie ??
                result.successData[allMovies.length ~/ 2],
            currentIndex: state.currentIndex ?? allMovies.length ~/ 2,
            isLoadingMoreMovies: false,
            actionMovies: actionMovies,
          ),
        );
        break;
      case Failure<List<MovieEntity>>():
        emit(
          state.copyWith(
            moviesStatus: StateStatus.failure(result.responseException),
            isLoadingMoreMovies: false,
          ),
        );
        emit(state.copyWith(moviesStatus: const StateStatus.initial()));
        break;
    }
  }

  void _changeSelectedMovie({required int index}) {
    emit(
      state.copyWith(
        selectedMovie: state.moviesStatus.data![index],
        currentIndex: index,
      ),
    );
  }

  Future<void> _loadMoreMovies() async {
    if (state.currentIndex == state.moviesStatus.data!.length - 3 &&
        !state.moviesStatus.isLoading) {
      _page++;
      await _fetchMovies();
    }
  }
}
