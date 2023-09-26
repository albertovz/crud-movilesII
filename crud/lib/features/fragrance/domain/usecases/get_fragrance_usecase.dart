import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/domain/repositories/fragrance_repository.dart';

class GetFragrancesUsecase {
  final FragranceRepository fragranceRepository;

  GetFragrancesUsecase (this.fragranceRepository);

  Future<List<Parfum>> execute () async {
    return await fragranceRepository.getFragrances();
  }
}