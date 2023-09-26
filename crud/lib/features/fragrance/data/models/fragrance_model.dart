import 'package:crud/features/fragrance/domain/entities/fragrance.dart';

class FragranceModel extends Parfum {
  FragranceModel(
      {required String id,
      required String title,
      required String perfumer,
      required String description,
      required String gender,
      required String price,
      required String year})
      : super(
            id: id,
            title: title,
            perfumer: perfumer,
            description: description,
            gender: gender,
            price: price,
            year: year);

  factory FragranceModel.fromJson(Map<String, dynamic> json) {
    return FragranceModel(
      id: json['id'],
      title: json['title'],
      perfumer: json['perfumer'],
      description: json['descriptiion'],
      gender: json['gender'],
      price: json['price'],
      year: json['year']
    );
  }

  factory FragranceModel.fromEntity (Parfum fragrance) {
    return FragranceModel (
      id: fragrance.id,
      title: fragrance.title,
      perfumer: fragrance.perfumer,
      description: fragrance.description,
      gender: fragrance.gender,
      price: fragrance.price,
      year: fragrance.year
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'perfumer': perfumer,
      'description': description,
      'gender': gender,
      'price': price,
      'year': year
    };
  }
}
