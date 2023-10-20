import 'package:flutter/material.dart';
import 'package:gebze/screens/home.dart';
import '../../utilities/colors.dart';

// ignore: must_be_immutable
class SplashScreenPage extends StatefulWidget {
  List<Map<String,dynamic>> documents = [];
  SplashScreenPage({Key? key, required this.documents}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(documents: widget.documents),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: CustomLinearGradient.baseBackgroundDecoration(
            const Color.fromARGB(255, 160, 160, 165),
            const Color.fromARGB(255, 160, 160, 165),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png',
              height: 300,
              width: 300,),
            ],
          ),
        ),
      ),
    );
  }
}
