import 'package:crud/features/fragrance/domain/repositories/fragrance_repository.dart';

class DeleteFragranceUsecase {
  final FragranceRepository fragranceRepository;

  DeleteFragranceUsecase (this.fragranceRepository);

  Future<void> execute (String id) async {
    return await fragranceRepository.deleteFragrance(id);
  }
}