import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/presentation/resources/assets_manager.dart';
import 'package:untitled1/presentation/resources/color_manger.dart';
import 'package:untitled1/presentation/resources/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;

  void startDelay() {
    timer = Timer(Duration(seconds: 5), goNext);
  }

  void goNext() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(AssetsManager.logoImage)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
