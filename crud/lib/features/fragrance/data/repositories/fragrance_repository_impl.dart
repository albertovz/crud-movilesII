import 'package:crud/features/fragrance/data/datasources/fragrance_local_data_source.dart';
import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/domain/repositories/fragrance_repository.dart';

class FragranceRepositoryImpl implements FragranceRepository {
  final FragranceLocalDataSource fragranceLocalDataSource;

  FragranceRepositoryImpl({required this.fragranceLocalDataSource});

  @override
  Future<List<Parfum>> getFragrances() async {
    return await fragranceLocalDataSource.getFragrances();
  }

  @override
  Future<void> createFragrance(Parfum fragrance) async {
    return await fragranceLocalDataSource.createFragrance(fragrance);
  }

  @override
  Future<void> updateFragrance(Parfum fragrance) async {
    return await fragranceLocalDataSource.updateFragrance(fragrance);
  }

  @override
  Future<void> deleteFragrance (String id) async {
    return await fragranceLocalDataSource.deleteFragrance(id);
  }
}