part of 'fragrances_bloc.dart';

abstract class FragrancesState {}

class FragrancesInitial extends FragrancesState {}

class GettingFragrances extends FragrancesState {}
class FragranceTable extends FragrancesState {
  final List<Parfum> fragrances;

  FragranceTable({required this.fragrances});
}

class ErrorGettingFragrances extends FragrancesState {
  final String message;

  ErrorGettingFragrances({required this.message});
}

class DeletingFragrance extends FragrancesState {}
class FragranceDeleted extends FragrancesState {}
class ErrorDeletingFragrance extends FragrancesState {
  final String message;

  ErrorDeletingFragrance({required this.message});
}