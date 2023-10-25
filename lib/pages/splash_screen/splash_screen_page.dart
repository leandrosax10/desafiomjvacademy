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
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const HomePage()));
    });
  }

//Animação
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
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
                  Color.fromARGB(255, 230, 240, 230),
                  Color.fromARGB(255, 5, 71, 126)
                ],
                stops: [
                  0.3,
                  0.9
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
                  ColorizeAnimatedText(
                    'Novos',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    textAlign: TextAlign.center,
                  ),
                  ColorizeAnimatedText(
                    'Seminovos',
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
                /* onFinished: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => LoginPage()));
                }, */
              ),
            ),

//fim Animação

            /*  child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  'StoreCar',
                  textStyle:
                      TextStyle(fontSize: 52.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                TypewriterAnimatedText(
                  'Novos e seminovos',
                  textStyle:
                      TextStyle(fontSize: 32.0, fontFamily: 'Canterbury', color: Colors.white),
                      speed: const Duration(milliseconds: 100)
                ),
              ],
            ),
             */
          ),
        ),
      ),
    );
  }
}
