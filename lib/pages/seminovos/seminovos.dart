import 'package:desafio_mjv_academy/components/storecar_sizebox.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/storecar_app_bar.dart';
import '../../components/storecar_bottom_navigator.dart';
import '../../components/storecar_drawer_menu.dart';
import '../../components/storecar_text_widget.dart';
import '../../data/repositories/car_repository.dart';
import '../../services/custom_dio.dart';
import '../home/car_store.dart';

class SemiNovosPage extends StatefulWidget {
  const SemiNovosPage({super.key});

  @override
  State<SemiNovosPage> createState() => _SemiNovosPageState();
}

class _SemiNovosPageState extends State<SemiNovosPage> {
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
        appBar: StoreCarAppBar(
          widget: Image.asset('assets/img/logo2.png'),
        ),
        body: Consumer<CarStore>(
          builder: (context, carStore, child) {
            if (carStore.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (carStore.erro.isNotEmpty) {
              return Center(
                child: TextWidget(
                  carStore.erro,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  align: TextAlign.center,
                ),
              );
            }

            if (carStore.state.isEmpty) {
              return const Center(
                child: TextWidget(
                  'Nenhum item na lista',
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  align: TextAlign.center,
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
                  return 
                   Column(
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
                        title: TextWidget(
                          item.name ?? '',
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              'R\$ ${item.price}0,00',
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            const StoreCarSizedBox(size: 4),
                            TextWidget(
                              item.description ?? '',
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
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
