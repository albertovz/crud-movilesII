part of 'fragrances_bloc.dart';

abstract class FragrancesEvent {}

class GetFragrances extends FragrancesEvent {}

class PressDeleteFragranceButton extends FragrancesEvent {
  final String id;

  PressDeleteFragranceButton({required this.id});
}