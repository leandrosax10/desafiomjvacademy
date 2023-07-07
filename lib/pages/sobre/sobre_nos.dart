import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../components/storecar_app_bar.dart';

final List<Map<String, String>> pages = [
  {
    'imageUrl': 'https://avatars.githubusercontent.com/u/44986666?v=4',
    'title': 'Leandro Santos',
    'text':
        'Desenvolvedor Jr, com experiência profissional e em trabalhos voluntários.',
  },
  {
    'imageUrl': 'https://avatars.githubusercontent.com/u/73924078?v=4',
    'title': 'Adriano Bitencourt',
    'text':
        'Desenvolvedor Jr, com experiência profissional em diversos projetos desafiadores.',
  },
];

//------------------------------------------
class SobreNosPage extends StatelessWidget {
  const SobreNosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreCarAppBar(
        title: 'Sobre nós',
      ),
      body: CarouselSlider.builder(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final page = pages[index];
          return buildPage(page);
        },
        options: CarouselOptions(
            enableInfiniteScroll: false,
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0),
      ),

      /* body: PageView(
        children: [
          const Center(
              child: TextWidget(
              'Slide 1',
              color: Colors.blue,
              align: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Container(
            color: Colors.amber,
            child: const Center(
              child: TextWidget(
                'Slide 2',
                color: Colors.white,
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ), */
    );
  }

  //teste
 Widget buildPage(Map<String, String> page) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.network(
            page['imageUrl']!,
            height: 200,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          page['title']!,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          page['text']!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}
}