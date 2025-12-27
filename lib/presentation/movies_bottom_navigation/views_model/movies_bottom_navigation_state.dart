import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/home/views/home_view.dart';
import 'package:movies_app/presentation/profile/view/profile_view.dart';

final class MoviesBottomNavigationState extends Equatable {
  final List<Widget> taps;
  final int currentIndex;

  const MoviesBottomNavigationState({
    this.currentIndex = 0,
    this.taps = const [
      HomeView(),
      Center(child: Text("Search")),
      Center(child: Text("Explore")),
      ProfileView(),
    ],
  });

  MoviesBottomNavigationState copyWith({
    int? currentIndex,
    List<Widget>? taps,
  }) {
    return MoviesBottomNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      taps: taps ?? this.taps,
    );
  }

  @override
  List<Object?> get props => [currentIndex, taps];
}
