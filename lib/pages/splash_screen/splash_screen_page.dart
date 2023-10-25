import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../home/home.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  openHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const HomePage()));
    });
  }

//Animação
  var colorizeColors = [
    //Colors.purple,
    Colors.blue,
    Colors.yellow,
    //Colors.red,
  ];

  var colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
//fim Animação

  @override
  Widget build(BuildContext context) {
    openHome();
    return SafeArea(
      child: Scaffold(
        //degrade
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 82, 82, 82),
                  Color.fromARGB(255, 1, 3, 5)
                ],
                stops: [
                  0.0,
                  0.1
                ]),
          ),
          //degrade
          child: Center(
            //Animação

            child: SizedBox(
              width: 250.0,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'StoreCar',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    textAlign: TextAlign.center,
                  ),
                ],
                //isRepeatingAnimation: true,
                totalRepeatCount: 1,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
