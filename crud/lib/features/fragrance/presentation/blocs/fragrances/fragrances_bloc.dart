import 'package:bloc/bloc.dart';
import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/domain/usecases/delete_fragrance.dart';
import 'package:crud/features/fragrance/domain/usecases/get_fragrance_usecase.dart';

part 'fragrances_event.dart';
part 'fragrances_state.dart';

class FragrancesBloc extends Bloc<FragrancesEvent, FragrancesState> {
  final GetFragrancesUsecase getFragranceUsecase;
  final DeleteFragranceUsecase deleteFragranceUsecase;

  FragrancesBloc(
      {required this.getFragranceUsecase, required this.deleteFragranceUsecase})
      : super(FragrancesInitial()) {
    on<FragrancesEvent>((event, emit) async {
      if (event is GetFragrances) {
        try {
          emit(GettingFragrances());
          List<Parfum> fragrances = await getFragranceUsecase.execute();
          emit(FragranceTable(fragrances: fragrances));
        } catch (e) {
          emit(ErrorGettingFragrances(message: e.toString()));
        }
      } else if (event is PressDeleteFragranceButton) {
        try {
          emit(DeletingFragrance());
          await deleteFragranceUsecase.execute(event.id);
          emit(FragranceDeleted());
        } catch (e) {
          emit(ErrorDeletingFragrance(message: e.toString()));
        }
      }
    });
  }
}
