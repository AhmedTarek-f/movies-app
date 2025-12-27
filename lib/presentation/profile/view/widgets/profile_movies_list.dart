import 'package:flutter/material.dart';

class ProfileMoviesList extends StatelessWidget {
  const ProfileMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Center(child: Text("Watch List")),
        Center(child: Text("History")),
      ],
    );
  }
}
