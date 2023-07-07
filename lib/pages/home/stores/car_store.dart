import 'package:flutter/foundation.dart';

import '../../../data/http/exceptions.dart';
import '../../../data/models/car_model.dart';
import '../../../data/repositories/car_repository.dart';

class CarStore extends ChangeNotifier {
  final CarRepository repository;

  bool isLoading = false;
  List<CarModel> state = [];
  String erro = '';

  CarStore({required this.repository});

  Future<void> getCars() async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await repository.getCars();
      state = result;
    } on NotFoundException catch (e) {
      erro = e.message;
    } catch (e) {
      erro = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
