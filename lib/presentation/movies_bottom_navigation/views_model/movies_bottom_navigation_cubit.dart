import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_intent.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_state.dart';

@injectable
class MoviesBottomNavigationCubit extends Cubit<MoviesBottomNavigationState> {
  MoviesBottomNavigationCubit() : super(const MoviesBottomNavigationState());
  late PageController pageController;

  void doIntent({required MoviesBottomNavigationIntent intent}) {
    switch (intent) {
      case ChangeIndexIntent():
        _changeIndex(index: intent.index);
        break;
      case MoviesBottomNavigationInitializationIntent():
        _onInit();
        break;
    }
  }

  void _onInit() {
    pageController = PageController(initialPage: state.currentIndex);
  }

  void _changeIndex({required int index}) {
    pageController.jumpToPage(index);
    emit(state.copyWith(currentIndex: index));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
