import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OnboardingEntity extends Equatable {
  final String title;
  final String image;
  final String description;
  final String buttonText;
  final LinearGradient gradientColors;

  OnboardingEntity({
    required this.title,
    required this.image,
    required this.description,
    required this.buttonText,
    required this.gradientColors,
  });

  @override
  List<Object?> get props => [
    title,
    image,
    description,
    buttonText,
    gradientColors,
  ];
}
