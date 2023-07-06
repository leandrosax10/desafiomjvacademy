import 'package:flutter/material.dart';

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
            Container(
              height: 35,
              width: mediaQuery.width - 190,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/img/two-cars.png',
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  ),
                  const StoreCarSizedBox(isHorizontal: true),
                  const TextWidget('Todos')
                ],
              ),
            ),
            const StoreCarSizedBox(),
            Container(
              height: 35,
              width: mediaQuery.width - 160,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/img/new-car.png',
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  ),
                  const StoreCarSizedBox(isHorizontal: true),
                  const TextWidget('Novos')
                ],
              ),
            ),
            const StoreCarSizedBox(),
            Container(
              height: 35,
              width: mediaQuery.width - 130,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/img/sale-car.png',
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  ),
                  const StoreCarSizedBox(isHorizontal: true),
                  const TextWidget('Seminovos')
                ],
              ),
            ),
            const StoreCarSizedBox(),
            Container(
              height: 35,
              width: mediaQuery.width - 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/img/about.png',
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  ),
                  const StoreCarSizedBox(isHorizontal: true),
                  const TextWidget('Sobre nós')
                ],
              ),
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
