part of 'fragrance_bloc.dart';

abstract class FragranceState {}

class FragranceInitial extends FragranceState {}

class SavingFragrance extends FragranceState {}
class FragranceSaved extends FragranceState {}
class ErrorSavingFragrance extends FragranceState {
  final String message;

  ErrorSavingFragrance({required this.message});
}