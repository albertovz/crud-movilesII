import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/domain/repositories/fragrance_repository.dart';

class CreateFragranceUsecase {
  final FragranceRepository fragranceRepository;

  CreateFragranceUsecase (this.fragranceRepository);

  Future<void> execute(Parfum fragrance) async {
    return await fragranceRepository.createFragrance(fragrance);
  }

}