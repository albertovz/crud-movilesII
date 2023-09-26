import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/domain/repositories/fragrance_repository.dart';

class UpdateFragranceUsecase {
  final FragranceRepository fragranceRepository;

  UpdateFragranceUsecase (this.fragranceRepository);

  Future<void> execute (Parfum fragrance) async {
    return await fragranceRepository.updateFragrance(fragrance);
  }
}