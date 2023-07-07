import 'package:desafio_mjv_academy/data/models/car_model.dart';

import '../../services/custom_dio.dart';

class CarRepository {
  final CustomDio dio;

  CarRepository({required this.dio});

  Future<List<CarModel>> getCars() async {
    try {
      var response = await dio.client.get('/cars/');
      return (response.data as List)
          .map((item) => CarModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Não foi possível carregar os veículos');
    }
  }
}
