import 'dart:convert';

import 'package:crud/features/fragrance/data/models/fragrance_model.dart';
import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FragranceLocalDataSource {
  Future<List<FragranceModel>> getFragrances();
  Future<void> createFragrance (Parfum fragrance);
  Future<void> updateFragrance (Parfum fragrance);
  Future<void> deleteFragrance (String id);
}

class FragranceLocalDataSourceImp implements FragranceLocalDataSource {
  @override
  Future<List<FragranceModel>> getFragrances() async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String fragrancesString = sharedPreferences.getString('fragrances') ?? "[]";
    List<FragranceModel> fragrances = jsonDecode(fragrancesString).map<FragranceModel>((data) => FragranceModel.fromJson(data)).toList();

    return fragrances;
  }

  @override
  Future<void> createFragrance(Parfum fragrance) async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String fragrancesString = sharedPreferences.getString('fragrances') ?? "[]";
    List<FragranceModel> fragrances = jsonDecode(fragrancesString).map<FragranceModel>((data) => FragranceModel.fromJson(data)).toList();

    fragrances.add(FragranceModel.fromEntity(fragrance));
    sharedPreferences.setString('fragrances', jsonEncode(fragrances));
  }

  @override
  Future<void> updateFragrance (Parfum fragrance) async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String fragrancesString = sharedPreferences.getString('fragrances') ?? "[]";
    List<FragranceModel> fragrances = jsonDecode(fragrancesString).map<FragranceModel>((data) => FragranceModel.fromJson(data)).toList();

    fragrances.add(FragranceModel.fromEntity(fragrance));
    sharedPreferences.setString('fragrances', jsonEncode(fragrances));
  }

  @override
  Future<void> deleteFragrance (String id) async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String fragrancesString = sharedPreferences.getString('fragrances') ?? "[]";
    List<FragranceModel> fragrances = jsonDecode(fragrancesString).map<FragranceModel>((data) => FragranceModel.fromJson(data)).toList();

    fragrances.removeWhere((item) => item.id == id);
    sharedPreferences.setString('fragrances', jsonEncode(fragrances));
  }
}