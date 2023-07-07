import 'package:desafio_mjv_academy/components/storecar_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/storecar_bottom_navigator.dart';
import '../../components/storecar_drawer_menu.dart';
import '../../components/storecar_sizebox.dart';
import '../../components/storecar_text_widget.dart';
import '../../data/repositories/car_repository.dart';
import '../../services/custom_dio.dart';
import 'car_store.dart';
import 'widgets/card_destaque.dart';

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
        appBar: StoreCarAppBar(
          widget: Image.asset('assets/img/logo2.png'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StoreCarSizedBox(),
                const TextWidget(
                  'Destaques:',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const StoreCarSizedBox(size: 10),
                SizedBox(
                  width: double.maxFinite,
                  height: 160,
                  child: Consumer<CarStore>(
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
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          padding: const EdgeInsets.all(8),
                          itemCount: carStore.state.length,
                          itemBuilder: (_, index) {
                            final item = carStore.state[index];
                            return CardDestaque(
                              image: item.img ?? '',
                              carro: item.name ?? '',
                              preco: item.price.toString(),
                              ano: item.year ?? DateTime.now().year,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Consumer<CarStore>(
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
                      return SizedBox(
                        width: double.maxFinite,
                        height: MediaQuery.sizeOf(context).height * .6,
                        child: ListView.separated(
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
                                  title: TextWidget(
                                    item.name ?? '',
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        'R\$ ${item.price}',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                      const StoreCarSizedBox(size: 4),
                                      TextWidget(
                                        item.description ?? '',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const StoreCarBottomNavigator(),
      ),
    );
  }
}
