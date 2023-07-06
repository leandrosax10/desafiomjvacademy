import 'dart:convert';

import 'package:desafio_mjv_academy/data/http/exceptions.dart';
import 'package:desafio_mjv_academy/data/http/http_client.dart';
import 'package:desafio_mjv_academy/data/models/car_model.dart';

abstract class ICarRepository {
  Future<List<CarModel>> getCars();
}

class CarRepository implements ICarRepository {
  final IHttpClient client;

  CarRepository({required this.client});

  @override
   Future<List<CarModel>> getCars() async {
    try {
      var response = await client.get(url: 'https://storecarapi.onrender.com/cars');
      return (response.data).map((item) => CarModel.fromJson(item)).toList();
    }  catch (e) {
      throw Exception('Não foi possível carregar os veículos');
    }
  }
/*   Future<List<CarModel>> getCars() async {
    final response = await client.get(
      url: 'https://storecarapi.onrender.com/cars',
    );

    if (response.statusCode == 200) {
      
      final body = jsonDecode(response.body);

      (body as List).map((item) =>
          CarModel.fromJson(item)
      ).toList();

      
    } else if (response.statusCode == 404) {
      throw NotFoundException(
          'A url informada não é válida ou está fora do ar.');
    } else {
      throw Exception('Não foi possível carregar os veículos.');
    }
  }
 */

}
