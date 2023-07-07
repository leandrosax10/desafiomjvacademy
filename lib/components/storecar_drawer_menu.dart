import 'package:flutter/material.dart';

import '../app_routes.dart';
import 'drawer_widget.dart';
import 'storecar_sizebox.dart';
import 'storecar_text_widget.dart';

class StoreCarDrawerMenu extends StatelessWidget {
  const StoreCarDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Drawer(
      backgroundColor: Colors.black,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/img/logo.png'),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const TextWidget(
                      'Bem-vindo de volta',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Colors.white),
            const StoreCarSizedBox(size: 30),
            DrawerWidget(
              image: 'assets/img/two-cars.png',
              label: 'Todos',
              width: mediaQuery.width - 190,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.initialRoute),
            ),
            const StoreCarSizedBox(),
            DrawerWidget(
              image: 'assets/img/new-car.png',
              label: 'Novos',
              width: mediaQuery.width - 160,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.novos),
            ),
            const StoreCarSizedBox(),
            DrawerWidget(
              image: 'assets/img/sale-car.png',
              label: 'Seminovos',
              width: mediaQuery.width - 130,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.seminovos),
            ),
            const StoreCarSizedBox(),
            DrawerWidget(
              image: 'assets/img/register.png',
              label: 'Cadastrar veículo',
              width: mediaQuery.width - 100,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.cadastro),
            ),
            const StoreCarSizedBox(),
            DrawerWidget(
              image: 'assets/img/about.png',
              label: 'Sobre nós',
              width: mediaQuery.width - 70,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.sobre),
            ),
            const StoreCarSizedBox(isFull: true),
            Image.asset(
              'assets/img/logo2.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
