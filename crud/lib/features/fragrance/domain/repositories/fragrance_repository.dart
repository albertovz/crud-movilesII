import 'package:crud/features/fragrance/domain/entities/fragrance.dart';

abstract class FragranceRepository {
  Future <List<Parfum>> getFragrances();
  Future<void> createFragrance (Parfum fragrance);
  Future<void> updateFragrance (Parfum fragrance);
  Future<void> deleteFragrance (String id);
}