import 'package:bloc/bloc.dart';
import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/domain/usecases/create_fragrance_usecase.dart';
import 'package:crud/features/fragrance/domain/usecases/update_fragrance_usecase.dart';

part 'fragrance_event.dart';
part 'fragrance_state.dart';

class FragranceBloc extends Bloc<FragranceEvent, FragranceState> {
  final CreateFragranceUsecase createFragranceUsecase;
  final UpdateFragranceUsecase updateFragranceUsecase;

  FragranceBloc(
      {required this.createFragranceUsecase,
      required this.updateFragranceUsecase})
      : super(FragranceInitial()) {
    on<FragranceEvent>((event, emit) async {
      if (event is PressCreateFragranceButton) {
        try {
          emit(SavingFragrance());
          await createFragranceUsecase.execute(event.fragrance);
          emit(FragranceSaved());
        } catch (e) {
          emit(ErrorSavingFragrance(message: e.toString()));
        }
      } else if (event is PressUpdateFragranceButton) {
        try {
          emit(SavingFragrance());
          await updateFragranceUsecase.execute(event.fragrance);
          emit(FragranceSaved());
        } catch (e) {
          emit(ErrorSavingFragrance(message: e.toString()));
        }
      }
    });
  }
}
