part of 'fragrance_bloc.dart';

abstract class FragranceEvent {}

class PressCreateFragranceButton extends FragranceEvent {
  final Parfum fragrance;

  PressCreateFragranceButton({required this.fragrance});
}

class PressUpdateFragranceButton extends FragranceEvent {
  final Parfum fragrance;

  PressUpdateFragranceButton({required this.fragrance});
}