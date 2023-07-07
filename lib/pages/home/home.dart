import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/storecar_bottom_navigator.dart';
import '../../components/storecar_drawer_menu.dart';
import '../../data/repositories/car_repository.dart';
import '../../services/custom_dio.dart';
import 'stores/car_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CarStore store;

  @override
  void initState() {
    super.initState();

    final dio = Dio();
    final customDio = CustomDio(dio);
    final carRepository = CarRepository(dio: customDio);

    store = CarStore(repository: carRepository);
    store.getCars();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CarStore>(
      create: (_) => store,
      child: Scaffold(
        drawer: const StoreCarDrawerMenu(),
        appBar: AppBar(),
        body: Consumer<CarStore>(
          builder: (context, carStore, child) {
            if (carStore.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (carStore.erro.isNotEmpty) {
              return Center(
                child: Text(
                  carStore.erro,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (carStore.state.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum item na lista',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: carStore.state.length,
                itemBuilder: (_, index) {
                  final item = carStore.state[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: Image.network(
                          item.img ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.name ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'R\$ ${item.price}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description ?? '',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            }
          },
        ),
        bottomNavigationBar: const StoreCarBottomNavigator(),
      ),
    );
  }
}
