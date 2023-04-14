import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sehatin/utils/global.colors.dart';
import 'package:sehatin/view/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: const Center(
        child: Image(
          image: AssetImage('images/logo2.png'),
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
