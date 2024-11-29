import 'dart:async';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/view/planet_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PlanetPage()));
    });
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/logo2.gif'),
              backgroundColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Galaxy Explorer',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2,),
          Text(
            'Explore planets, discover wonders',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
