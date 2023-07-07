// import 'package:flutter/material.dart';

// import '../../../data/http/exceptions.dart';
// import '../../../data/models/car_model.dart';
// import '../../../data/repositories/car_repository.dart';

// class CarStore {
//   final CarRepository repository;

//   final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

//   final ValueNotifier<List<CarModel>> state = ValueNotifier<List<CarModel>>([]);

//   final ValueNotifier<String> erro = ValueNotifier<String>('');

//   CarStore({required this.repository});

//   Future getCars() async {
//     isLoading.value = true;

//     try {
//       final result = await repository.getCars();
//       state.value = result;
//     } on NotFoundException catch (e) {
//       erro.value = e.message;
//     } catch (e) {
//       erro.value = e.toString();
//     }
//     isLoading.value = false;
//   }
// }

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
