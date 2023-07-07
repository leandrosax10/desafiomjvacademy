import 'package:desafio_mjv_academy/components/storecar_sizebox.dart';
import 'package:flutter/material.dart';

class CardDestaque extends StatelessWidget {
  final String image;
  final String carro;
  final String preco;
  final int ano;
  const CardDestaque({
    super.key,
    required this.image,
    required this.carro,
    required this.preco,
    required this.ano,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          const StoreCarSizedBox(size: 8),
          SizedBox(
            width: 85,
            height: 14,
            child: Text(
              carro,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 90,
            height: 18,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'R\$ $preco',
                    style: const TextStyle(
                      color: Color(0xFFC3A711),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(
                    text: ',00',
                    style: TextStyle(
                      color: Color(0xFFC3A711),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 75,
            height: 70,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 40,
            height: 7,
            child: Text(
              (ano == DateTime.now().year) ? 'Novo(0 KM)' : 'Seminovo',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFADADB4),
                fontSize: 8,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
