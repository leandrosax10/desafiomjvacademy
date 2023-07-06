import 'package:desafio_mjv_academy/data/http/exceptions.dart';
import 'package:desafio_mjv_academy/data/models/car_model.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/car_repository.dart';

class CarStore {
  final ICarRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<CarModel>> state = ValueNotifier<List<CarModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  CarStore({required this.repository});

Future getCars() async {
    isLoading.value = true;

    try {
      final result = await repository.getCars();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
